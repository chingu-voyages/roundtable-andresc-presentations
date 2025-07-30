# Database normalization

Normalization is the process of breaking down complex data into a set of tables to imporve data integrity and redundancy.

There are the following normal forms

- 1NF
- 2NF
- 3NF
- BCNF
- 4NF
- 5NF
- 6NF

Usually one normalizes up to the 3NF.

## 1NF

**First Normal Form** is the foundation level of database normalization.

- Atomicity: Each attribute (column) contains only a single, indivisible value. For example, a "phone number" column should store only one phone number per row, not a list of numbers
- No Repeating Groups: There are no sets of columns that are repeated within a row. For instance, instead of having columns like "child1", "child2", "child3" to store children's names,
  you would create a separate table to store child information, linked to the main table with a foreign key
- Unique Column Names: Each column in the table must have a distinct name. 
- No Order Dependency: The order of rows or columns within the table should not be significant.
- Consistent Data Types: All values within a single column should be of the same data type.
- Primary Key: Each table must have a primary key that uniquely identifies each row.

### Example 0NF

| name  | transaction_date | transaction_amount | product    |
|-------|------------------|--------------------|------------|
| John  | [ 2022-01-01,    | [ 100.00,          | [ Apple ,  |
|       |   2022-01-02,    |   200.00,          |   Banana,  |
|       |   2022-01-02 ]   |   200.00 ]         |   Orange ] |
| Alex  | [ 2022-01-15 ]   | [ 150.00 ]         | [ Aple ]   |
| Maria | [ 2022-02-02 ]   | [ 783.00 ]         | [ Banana ] |

In this example we can see that the data is not in the first normal form. 

There is no primary key window, the data is not consistent, and the data is not unique.

### Example 1NF

| id | name  | transaction_date | transaction_amount | product    |
|----|-------|------------------|--------------------|------------|
| 1  | John  | 2022-01-01       | 100.00             | Apple      |
| 2  | John  | 2022-01-02       | 200.00             | Banana     |
| 3  | John  | 2022-01-02       | 200.00             | Orange     |
| 4  | Alex  | 2022-01-15       | 150.00             | Aple       |
| 5  | Maria | 2022-02-02       | 783.00             | Banana     |

## 2NF

**Second Normal Form** is a step up from the first normal form.

- Each table is in 1NF. This is important, you can not have tables in 2NF that are not in 1NF.
- All non-key attributes are fully dependant on the primary key.

### Example 2NF

|               Customer Table                        |
|-----------------------------------------------------|
| id | first name | last name | full name   | email   |
|----|------------|-----------|-------------|---------|
| 1  | John       | Smith     | John Smith  | jsmith  |
| 2  | Alex       | Doe       | Alex Doe    | adoe    |
| 3  | Maria      | Doe       | Maria Doe   | mdoe    |

|               Transaction Table                                       |
|-----------------------------------------------------------------------|
| id | customer_id | transaction_date | transaction_amount | product    |
|----|-------------|------------------|--------------------|------------|
| 1  | 1           | 2022-01-01       | 100.00             | Apple      |
| 2  | 1           | 2022-01-02       | 200.00             | Banana     |
| 3  | 1           | 2022-01-02       | 200.00             | Orange     |
| 4  | 2           | 2022-01-15       | 150.00             | Aple       |
| 5  | 3           | 2022-02-02       | 783.00             | Banana     |


## 3NF

**Third Normal Form** is a step up from the second normal form.

- Each table is in 2NF.
- No transitive dependency between non-key attributes.
- No non-key attributes that are not fully dependant on the primary key.

### Example 3NF

|               Customer Table          |
|---------------------------------------|
| id | first name | last name | email   |
|----|------------|-----------|---------|
| 1  | John       | Smith     | jsmith  |
| 2  | Alex       | Doe       | adoe    |
| 3  | Maria      | Doe       | mdoe    |

|               Transaction Table                                       |
|-----------------------------------------------------------------------|
| id | customer_id | transaction_date | transaction_amount | product    |
|----|-------------|------------------|--------------------|------------|
| 1  | 1           | 2022-01-01       | 100.00             | Apple      |
| 2  | 1           | 2022-01-02       | 200.00             | Banana     |
| 3  | 1           | 2022-01-02       | 200.00             | Orange     |
| 4  | 2           | 2022-01-15       | 150.00             | Aple       |
| 5  | 3           | 2022-02-02       | 783.00             | Banana     |

