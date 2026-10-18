# ExpressMall Index Inspection

## Purpose
Inspect existing PostgreSQL indexes before introducing additional indexes.

## Finding
The `perfumes` table already has an index involving the `brand_id` column. The existing index was identified through the PostgreSQL `pg_indexes` catalog.

## Decision
No additional index on `perfumes.brand_id` will be created at this stage because an index already exists on that column. Adding a duplicate index may increase storage use and write overhead without providing a meaningful benefit.

## Next Step
Measure another representative query and examine its execution plan before deciding whether further optimisation is justified.

## Evidence
The index inspection results are saved in `performance-results/existing-indexes.png`.