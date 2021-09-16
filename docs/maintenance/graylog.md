## get all indices

```
docker exec -it graylog_elasticsearch_1 curl -XGET localhost:9200/_cat/indices
```

## Increase field number

```
docker exec -it graylog_elasticsearch_1 curl -XPUT -d'{"index.mapping.total_fields.limit": 2000}'  -H "Content-Type: application/json" localhost:9200/beryjuorg_long_215/_settings
```
