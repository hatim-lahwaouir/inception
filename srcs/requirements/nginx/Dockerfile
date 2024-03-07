FROM alpine



COPY --chmod=111 tools/setup.sh /scripts/

COPY --chmod=111 start.sh /scripts/

RUN /scripts/setup.sh



ENTRYPOINT ["/scripts/start.sh"]
