FROM mcr.microsoft.com/devcontainers/python:3-3.14-trixie

RUN rm /etc/apt/sources.list.d/yarn.list && \
    echo "deb [signed-by=/etc/apt/keyrings/zabbly.asc] https://pkgs.zabbly.com/incus/stable trixie main" >> /etc/apt/sources.list.d/incus.list && \
    curl -fsSL https://pkgs.zabbly.com/key.asc -o /etc/apt/keyrings/zabbly.asc && \
    apt-get update && \
    apt-get install -y incus-client

RUN --mount=type=bind,target=/build/bashrc,src=./bashrc \
    cat /build/bashrc >> /home/vscode/.bashrc
