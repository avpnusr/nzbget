FROM alpine:latest
MAINTAINER avpnusr

ENV LANG='en_US.UTF-8' \
    LANGUAGE='en_US.UTF-8' \
    TERM='xterm'

RUN apk --update --no-cache add \
    python tzdata unrar p7zip curl && \
    LINK=$(curl -s "https://nzbget.net/info/nzbget-version-linux.json" | grep stable | cut -d '"' -f 4 | grep run) && \
    wget -O /opt/nzbget.run ${LINK} && \
    cd /opt && /bin/sh nzbget.run && \
    apk del curl && \
    rm -rf /tmp/* && \
    rm -rf /opt/nzgbet.run && \
    rm -rf /var/cache/apk/*

VOLUME ["/config", "/downloads"]

EXPOSE 6789

HEALTHCHECK --interval=120s --timeout=15s --start-period=120s --retries=3 \
            CMD wget --no-check-certificate --quiet --spider 'http://localhost:6789' && echo "HealthCheck successful..." || exit 1

ENTRYPOINT [ "/opt/nzbget/nzbget", "-s" ]
