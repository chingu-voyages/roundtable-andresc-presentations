BEGIN;

    -- 1. Create tables
    CREATE TABLE IF NOT EXISTS users (
        id serial PRIMARY KEY,
        handle text NOT NULL UNIQUE,
        created_at timestamptz NOT NULL DEFAULT now()
    );

    CREATE TABLE IF NOT EXISTS issues (
        id serial PRIMARY KEY,
        user_id int NOT NULL REFERENCES users (id),
        status text NOT NULL CHECK (status IN ('open', 'closed')),
        priority int NOT NULL CHECK (priority BETWEEN 1 AND 5),
        title text NOT NULL,
        created_at timestamptz NOT NULL DEFAULT now(),
        updated_at timestamptz NOT NULL DEFAULT now()
    );

    CREATE TABLE IF NOT EXISTS comments (
        id serial PRIMARY KEY,
        issue_id int NOT NULL REFERENCES issues (id),
        user_id int NOT NULL REFERENCES users (id),
        body text NOT NULL,
        archive boolean NOT NULL DEFAULT false,
        created_at timestamptz NOT NULL DEFAULT now()
    );

    CREATE TABLE IF NOT EXISTS publications (
        id serial PRIMARY KEY,
        date date NOT NULL,
        name text NOT NULL,
        description text,
        created_at timestamptz NOT NULL DEFAULT now()
    );

    -- 2. Clear existing data
    TRUNCATE TABLE users, issues, comments, publications RESTART IDENTITY;

    -- 3. Create 100 random users
    INSERT INTO users (handle, created_at)
    SELECT
        format('user_%s_%s', qs, substr(md5(random()::text), 1, 6)) AS handle,
        now() - (random() * interval '365 days') AS created_at
    FROM generate_series(1, 100) as qs;

    -- 4. Create 10000 random issues (random creator, random open/closed)
    INSERT INTO issues (user_id, status, priority, title, created_at, updated_at)
    SELECT
        (floor(random() * 100) + 1)::bigint AS user_id,
        CASE WHEN random() < 0.65 THEN 'open' ELSE 'closed' END AS status,
        (floor(random() * 5) + 1)::int AS priority,
        format('issue_%s_%s', qs, substr(md5(random()::text), 1, 6)) AS title,
        -- spread issues over the last year
        now() - (random() * interval '365 days') AS created_at,
        -- updated_ad some time after createdd-at (up to 30 days later)
        now() - (random() * interval '365 days') + (random() * interval '30 days') AS updated_at 
    FROM generate_series(1, 10000) as qs;

    -- 5. Create 1_000_000 random comments (random issue_id, user_id; 1% archived)
    INSERT INTO comments (issue_id, user_id, body, archive, created_at)
    SELECT
        (floor(random() * 10000) + 1)::bigint AS issue_id,
        (floor(random() * 100) + 1)::bigint AS user_id,
        format('comment_%s_%s', qs, substr(md5(random()::text), 1, 6)) AS body,
        random() < 0.01 AS archive,
        -- spread comments over the last year
        now() - (random() * interval '365 days') AS created_at
    FROM generate_series(1, 1000000) as qs;

    -- 6. Create 10000000 publications
    INSERT INTO publications (date, name, description, created_at)
    SELECT
        now() - (random() * interval '3 years') AS date,
        format('publication_%s_%s', qs, substr(md5(random()::text), 1, 6)) AS name,
        format('description_%s_%s', qs, substr(md5(random()::text), 1, 6)) AS description,
        now() - (random() * interval '3 years') AS created_at
    FROM generate_series(1, 10000000) as qs;

COMMIT;
