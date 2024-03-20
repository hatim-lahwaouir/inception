FROM alpine:3.18



COPY --chmod=111 tools/setup.sh /scripts/
COPY --chmod=111 conf/conf.sh /scripts/

RUN /scripts/setup.sh

EXPOSE 9000

ENTRYPOINT ["/scripts/conf.sh"]
