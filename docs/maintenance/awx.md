# AWX disk cleanup

## Cleanup old objects

```
# docker exec -it awx_task /bin/bash
# or for k8s
kubectl exec -it awx-b5f6cf4d4-n25d6 -c awx-task -- bash
```

Then, inside the container

```bash
/usr/bin/awx-manage cleanup_jobs --days=30
```

## Vacuum database

```
# docker exec -it awx_postgres psql -U awx
# or for k8s
kubectl exec -it awx-postgres-0 -- psql -U awx
```

Then, inside the container

```sql
SELECT nspname || '.' || relname AS "relation",
    pg_size_pretty(pg_relation_size(C.oid)) AS "size"
  FROM pg_class C
  LEFT JOIN pg_namespace N ON (N.oid = C.relnamespace)
  WHERE nspname NOT IN ('pg_catalog', 'information_schema')
  ORDER BY pg_relation_size(C.oid) DESC
  LIMIT 20;
```

to find the biggest tables.

Then run

```sql
VACUUM FULL public.main_jobevent;
```

Sources: https://tobschall.de/2019/05/07/ansible-tower-cleanup/
