# Sentry disk cleanup

See https://develop.sentry.dev/self-hosted/troubleshooting/

```
docker-compose exec worker sentry cleanup --days 30
```

To compress the database, run

```
docker-compose exec postgres psql -U sentry
```

In the postgres prompt, run

```sql
SELECT nspname || '.' || relname AS "relation",
    pg_size_pretty(pg_total_relation_size(C.oid)) AS "total_size"
  FROM pg_class C
  LEFT JOIN pg_namespace N ON (N.oid = C.relnamespace)
  WHERE nspname NOT IN ('pg_catalog', 'information_schema')
    AND C.relkind <> 'i'
    AND nspname !~ '^pg_toast'
  ORDER BY pg_total_relation_size(C.oid) DESC
  LIMIT 20;
```

To find out the largest table (probably `public.nodestore_node`)

then run
```sql
vacuum FULL public.nodestore_node;
```
