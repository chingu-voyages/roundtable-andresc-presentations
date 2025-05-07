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
ALTER VIEW view_name AS SELECT ... FROM table_name;
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
