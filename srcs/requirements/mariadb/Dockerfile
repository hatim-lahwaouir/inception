FROM debian

COPY --chmod=111 tools/setup.sh /scripts/
COPY --chmod=111 conf/conf.sh /scripts/

EXPOSE 3306
RUN /scripts/setup.sh

ENTRYPOINT ["/scripts/conf.sh"]
