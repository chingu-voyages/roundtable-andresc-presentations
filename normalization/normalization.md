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

| player_id  | item                                     | quantity        | 
|------------|------------------------------------------|-----------------|
| jdog21     | [ amulets, rings]                        | [ 2, 4]         |
| gilal9     | [ copper coins ]                         | [ 18 ]          |
| trev73     | [ shields, arrows, copper coins, rings ] | [ 3, 5, 30, 7 ] |


### Solution

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

### Solution

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
| gila19     | Beginner      |
| trev73     | Advanced      |
| tina42     | Beginner      |

Primary key is `player_id`

## 3NF

lets add a `skill level` to our table

| player_id  | Player_rating | skill_level |
|------------|---------------|-------------|
| jdog21     | Intermediate  |     5       |
| gila19     | Beginner      |     3       |
| trev73     | Advanced      |     7       |
| tina42     | Beginner      |     1       |

Primary key is `player_id`

We could update the skill level of a player and not the rating causing data insconsistency

**Definitions**

- Each non-key attribute must depend on the key, and nothing but the key

### Solution

| player_id  | skill_level |
|------------|-------------|
| jdog21     |     5       |
| gila19     |     3       |
| trev73     |     7       |
| tina42     |     1       |

Primary key is `player_id`

| skill_level | Player_rating |
|-------------|---------------|
|     1       | Beginner      |
|     2       | Beginner      |
|     3       | Beginner      |
|     4       | Intermediate  |
|     5       | Intermediate  |
|     6       | Intermediate  |
|     7       | Advanced      |
|     8       | Advanced      |
|     9       | Advanced      |

Primary key is `skill_level`
