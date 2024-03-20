FROM alpine:3.18



COPY --chmod=111 tools/setup.sh /scripts/


RUN /scripts/setup.sh



ENTRYPOINT ["nginx", "-g" ,"daemon off;"]
