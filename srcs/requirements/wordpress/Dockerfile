FROM alpine



COPY --chmod=111 tools/setup.sh /scripts/
COPY --chmod=111 conf/conf.sh /scripts/
COPY --chmod=444 .env /scripts/

RUN /scripts/setup.sh


ENTRYPOINT ["/scripts/conf.sh"]
