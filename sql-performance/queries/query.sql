-- Get the size of each index
SELECT
    schemaname,
    relname AS table_name,
    indexrelname AS index_name,
    pg_size_pretty(pg_relation_size(indexrelid)) AS index_size,
    pg_relation_size(indexrelid) AS index_size_bytes
FROM
    pg_stat_user_indexes
ORDER BY
    index_size_bytes DESC;


 -- Get the row count for each partition
SELECT 
  tableoid::regclass AS partition_name,
  COUNT(*) AS row_count
FROM publications
GROUP BY tableoid;   

-- Get the table size
SELECT
    schemaname || '.' || tablename AS table_name,
    pg_size_pretty(pg_total_relation_size(schemaname || '.' || tablename)) AS size
FROM pg_tables WHERE schemaname in ('public', 'part')
ORDER BY pg_total_relation_size(schemaname || '.' || tablename) DESC;

