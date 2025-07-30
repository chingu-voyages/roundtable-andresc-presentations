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

- Using row order to convey information is not permitted. Eg. Table with The Beatles order by height
- Mixing data types within the same column is not permitted.
- Having a table without a primary key is not permitted.
- Repeating groups are not permitted.

### Example 0NF

| player_id  | iteem                                    | quantity        | 
|------------|------------------------------------------|-----------------|
| jdog21     | [ amulets, rings]                        | [ 2, 4]         |
| gilal9     | [ copper coins ]                         | [ 18 ]          |
| trev73     | [ shields, arrows, copper coins, rings ] | [ 3, 5, 30, 7 ] |


### Example 1NF

| player_id  | item         | quantity |
|------------|--------------|----------|
| jdog21     | amulets      |      2   |
| jdog21     | rings        |      4   |
| gilal9     | copper coins |     18   |
| trev73     | shilelds     |      3   |
| trev73     | arrows       |      5   |
| trev73     | copper coins |     30   |
| trev73     | rings        |      7   |

Primary key is `player_id + item`

## 2NF

lets say we add a player rating to our table

| player_id  | item         | quantity | player_rating |
|------------|--------------|----------|---------------|
| jdog21     | amulets      |      2   | Intermediate  |
| jdog21     | rings        |      4   | Intermediate  |
| gilal9     | copper coins |     18   | Beginner      |
| trev73     | shilelds     |      3   | Advanced      |
| trev73     | arrows       |      5   | Advanced      |
| trev73     | copper coins |     30   | Advanced      |
| trev73     | rings        |      7   | Advanced      |

Primary key is `player_id + item`

- if gila19 looses its coins we get a `deletion anomaly` since we loose all of its information.
- if jdog21 is promoted to `advanced` we can get an `update anomaly` since only one of the records could be updated
- if we want to add a new player we get an `insert anomaly` since it does not have any inventory

**Definitions**

- Each non-key attribute must depend on the entire primary key

| player_id  | item         | quantity | 
|------------|--------------|----------|
| jdog21     | amulets      |      2   | 
| jdog21     | rings        |      4   | 
| gilal9     | copper coins |     18   | 
| trev73     | shilelds     |      3   | 
| trev73     | arrows       |      5   | 
| trev73     | copper coins |     30   | 
| trev73     | rings        |      7   | 

Primary key is `player_id + item`

| player_id  | Player_rating |
|------------|---------------|
| jdog21     | Intermediate  |
| jdog21     | Intermediate  |
| gilal9     | Beginner      |

Primary key is `player_id`

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

