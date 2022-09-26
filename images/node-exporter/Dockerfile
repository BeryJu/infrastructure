FROM quay.io/prometheus/node-exporter:v1.4.0

ENV CONFIG=config/node-exporter.yaml

ENTRYPOINT [ "/bin/sh" ]

USER 106

CMD [ "-c", "node_exporter --web.config=${CONFIG} --collector.textfile.directory /textfile" ]
