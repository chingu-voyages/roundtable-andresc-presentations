# Improve Database Queries

## Types of improvements

- Indexes
- Partitioning
- Sharding

## Indexes

- Create indexes to speed up queries
- Indexes can be costly to create
     - Can cost in disk space
     - Can cost in memory
     - On mutation queries (insert, update, delete)

## Types of Indexes

- Clustered Indexes
- Nonclustered Indexes

## Clustered Indexes

- Clustered indexes are the ones that orders the data in disk
- There can only be one clustered index per table
- In general clustered indexes are created by the primary key
- In the case of `PostgreSQL` there are no clusterd indexes by default
     - Must be created manually
     - Must be maintained regularly

## Nonclustered Indexes

- There can be many nonclustered indexes per table
- Adds a pointer to each value
- Can be created manually
- Are saved on disk
- Are updated on every insert, update, or delete

## Partitioning

- On large tables indexes could take up a lot of space
- And also can really impact the mutation performances
- Can be by `Range`, `Hash`, or `List`
- Partition column **MUST** be part of the `PRIMARY KEY`
