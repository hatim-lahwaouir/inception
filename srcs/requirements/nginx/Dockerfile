FROM alpine



COPY --chmod=111 tools/setup.sh /scripts/
COPY --chmod=111 conf/nginx_conf.sh /scripts/

RUN /scripts/setup.sh



ENTRYPOINT ["/scripts/nginx_conf.sh"]
