# Taken from https://github.com/puppetlabs/puppet-agent/blob/main/docker/puppet-agent-ubuntu/Dockerfile
ARG debian_version=11

FROM debian:${debian_version}

ARG version="7.0.0"
ARG vcs_ref
ARG build_date
ARG DEBIAN_CODENAME="bullseye"

ENV PATH=/opt/puppetlabs/server/bin:/opt/puppetlabs/puppet/bin:/opt/puppetlabs/bin:$PATH

ADD https://apt.puppetlabs.com/puppet7-release-"$DEBIAN_CODENAME".deb /puppet7.deb

# hadolint ignore=DL3008
RUN dpkg -i /puppet7.deb && \
    rm /puppet7.deb && \
    apt-get update && \
    apt-get install --no-install-recommends -y ca-certificates lsb-release puppet-agent && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

LABEL org.label-schema.vcs-ref="$vcs_ref" \
      org.label-schema.version="$version" \
      org.label-schema.build-date="$build_date"

COPY Dockerfile /
COPY ./entrypoint.sh /

ENTRYPOINT ["/bin/bash"]
CMD ["/entrypoint.sh"]
