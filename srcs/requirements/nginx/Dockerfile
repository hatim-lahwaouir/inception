FROM alpine


# RUN apt -y update
# RUN apt -y install nginx

RUN apk add nginx

ENTRYPOINT ["nginx"]

CMD ["-g daemon off;"]
