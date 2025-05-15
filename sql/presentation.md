# SQL

Structured Query Language

## What s SQL?

SQL (Structured Query Language) is a computer programming language used to manage data stored in a database, which store structured data in tables. Its syntax is easy to read, so it's easy to pick up on even if you're a non-technical user

## Types of SQL Objects

- Database

- Table: Used to store data in structured format
    - Column
    - Row

- Views: Virtual tables that provides a customized view of data from one or more tables

- Index: Used to optimize the performance of queries

- Constraint: Ensuer data integrity

```markdown
The following are other types out of scope of this presentation

- Stored Procedures: Used to automate specific tasks

- Trigger: Special type of stored procedure that automatically execute in response to specific event on a table

```

## Types of SQL Commands

- Schema related commands
    - CREATE
    - DROP
    - ALTER

- Data manipulation commands for CRUD operations
    - INSERT (Create)
    - SELECT (Read)
    - UPDATE (Update)
    - DELETE (Delete)

## Schema Commands - CREATE

Used to create a new database, table, views or index

```sql
CREATE DATABASE database_name;
CREATE TABLE table_name (column_name data_type, ...);
CREATE VIEW view_name AS SELECT ... FROM table_name;
CREATE INDEX index_name ON table_name (column_name);
```

NOTE: [PostgreSQL Data Types](https://www.postgresql.org/docs/current/datatype.html) referece

## Schema Commands - CREATE


```sql
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

## Schema Commands - DROP

Used to delete a database, table, view or index

```sql
DROP DATABASE database_name;
DROP TABLE table_name;
DROP VIEW view_name;
DROP INDEX index_name;
```

NOTE: This command is destructive and cannot be undone

## Schema Commands - ALTER

Used to modify an existing database, table or view

```sql
ALTER DATABASE database_name;
ALTER TABLE table_name ADD column_name data_type;
ALTER TABLE table_name DROP column_name;
```

## Data Manipulation Commands - INSERT

Used to insert data into a table

```sql
INSERT INTO table_name (column_name, ...) VALUES (value, ...);
```

## Data Manipulation Commands - UPDATE

Used to update data in a table

```sql
UPDATE table_name SET column_name = value WHERE condition;
```

## Data Manipulation Commands - DELETE

Used to delete data from a table

```sql
DELETE FROM table_name WHERE condition;
```

NOTE: This command is destructive and cannot be undone

## Data Manipulation Commands - SELECT

Used to query data from a table, in its most simple form:

```sql
SELET column_name, ... FROM table_name [ WHERE condition ORDER BY sorting ]
```

Note: both `WHERE` and `ORDER BY` are optional keywords 
```

## Data Manipulation Commands - SELECT

we can find out the total in all the accounts

```sql
SELECT COUNT(client) FROM client;
```

or we can find the total clients in a specific country

```sql
SELECT country.name, COUNT(client.name)
FROM client
JOIN country on country.id = client.country_id;
```

## Data Manipulation Commands - SELECT

Lets see if we can show also those countries where we don't have any clients

```sql
SELECT country.name, COUNT(client.name)
FROM client
RIGHT OUTER JOIN country on country.id = client.country_id;
GROUP BY country.name
```

## Data Manipulation Commands - Transactions

In a RDBMS there is the concept of transactions where `INSERT`, `UPDATE` and `DELETE` commands are ***not executed*** until it is commited, giving you the ability to reset the data if necessary

```sql
BEGIN

INSERT INTO table_name (column_name, ...) VALUES (value, ...);
UPDATE table_name SET column_name = value WHERE condition;
DELETE FROM table_name WHERE condition;

COMMIT
ROLLBACK ```
