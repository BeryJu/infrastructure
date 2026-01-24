FROM mcr.microsoft.com/devcontainers/python:2-3.14-trixie

RUN --mount=type=bind,target=/build/bashrc,src=./bashrc \
    cat /build/bashrc >> /home/vscode/.bashrc
