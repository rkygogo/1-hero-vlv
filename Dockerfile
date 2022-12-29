FROM alpine:latest

COPY ./content /workdir/

RUN apk add --no-cache curl runit caddy jq \
    && chmod +x /workdir/service/*/run /workdir/*.sh \
    && /workdir/install.sh \
    && ln -s /workdir/service/* /etc/service/

ENV PORT=80

EXPOSE 80

ENTRYPOINT ["runsvdir", "-P", "/etc/service"]
