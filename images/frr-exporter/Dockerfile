FROM tynany/frr_exporter:v1.1.4

ENV CONFIG=config/node-exporter.yaml

ENTRYPOINT [ "/bin/sh" ]

CMD [ "-c", "/app/frr_exporter --web.config.file=${CONFIG}" ]
