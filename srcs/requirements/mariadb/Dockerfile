FROM debian

COPY --chmod=111 tools/setup.sh /scripts/


RUN /scripts/setup.sh

ENTRYPOINT ["mysqld_safe"]
