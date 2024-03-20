FROM debian:11

COPY --chmod=111 tools/setup.sh /tmp/
COPY --chmod=111 conf/conf.sh /tmp/

EXPOSE 3306
RUN /tmp/setup.sh



ENTRYPOINT ["/tmp/conf.sh"]
