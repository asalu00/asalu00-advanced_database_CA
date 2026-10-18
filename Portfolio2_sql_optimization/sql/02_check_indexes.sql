-- ExpressMall SQL Query Optimisation
-- Step 2: Inspect existing indexes

SELECT
    tablename,
    indexname,
    indexdef
FROM pg_indexes
WHERE schemaname = 'expressmall'
ORDER BY tablename, indexname;