CREATE TABLE country (
  id char(2) PRIMARY KEY,
  name VARCHAR(255),

  unique (name)
);

CREATE TABLE client (
  id uuid PRIMARY KEY default gen_random_uuid(),
  name VARCHAR(255) NOT NULL,
  surname VARCHAR(255) NOT NULL,
  country_id CHAR(2) NOT NULL REFERENCES country on delete restrict
);

CREATE TABLE account (
  id SERIAL PRIMARY KEY,
  number VARCHAR(255) NOT NULL,
  client_id uuid NOT NULL REFERENCES client (id) on delete restrict,
  ammount DECIMAL(15,6),

  unique (number)
);

ALTER TABLE client ADD CONSTRAINT client_name_surname_unique UNIQUE (name, surname);

INSERT INTO country (id, name) VALUES
  ('US', 'UNITED STATES'),
  ('EC', 'ECUADOR'),
  ('CL', 'CHILE'),
  ('DE', 'GERMANY'),
  ('ES', 'SPAIN'),
  ('AU', 'AUSTRALIA'),
  ('GB', 'UNITED KINGDOM');

INSERT INTO client (name, surname, country_id) VALUES
  ('Jim', 'Medlock', 'US'),
  ('Andres', 'Court', 'EC');
