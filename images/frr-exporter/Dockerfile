FROM tynany/frr_exporter:v1.2.0

ENV CONFIG=config/node-exporter.yaml

ENTRYPOINT [ "/bin/sh" ]

CMD [ "-c", "/app/frr_exporter --web.config.file=${CONFIG}" ]
