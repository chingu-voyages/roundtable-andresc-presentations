BEGIN;

    -- 1. Rename table
    ALTER TABLE publications RENAME TO publications_old;

    -- 2. Create new table
    CREATE TABLE IF NOT EXISTS publications (
        id serial,
        date date NOT NULL,
        name text NOT NULL,
        description text,
        created_at timestamptz NOT NULL DEFAULT now()
    ) PARTITION BY RANGE (date);

    -- 3. Create schema for partitions
    CREATE SCHEMA IF NOT EXISTS part;

    -- 4. Create partitions
    CREATE TABLE part.publications_2023 PARTITION OF publications FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');
    CREATE TABLE part.publications_2024 PARTITION OF publications FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');
    CREATE TABLE part.publications_2025 PARTITION OF publications FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');
    CREATE TABLE part.publications_2026 PARTITION OF publications FOR VALUES FROM ('2026-01-01') TO ('2027-01-01');

    -- 5. Move data
    INSERT INTO publications SELECT * FROM publications_old;

COMMIT;
