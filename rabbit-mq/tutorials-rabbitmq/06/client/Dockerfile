FROM golang:1.14.4
RUN go get github.com/streadway/amqp && \
    mkdir /app
ADD . /app
WORKDIR /app
RUN go build -o main .
EXPOSE 8080
ENTRYPOINT [ "/app/main" ]