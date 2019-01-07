FROM golang:latest

MAINTAINER Didi Dwi Novianto <me@dididwinovianto.com>
RUN mkdir -p ${GOPATH}/src/github.com/mingrammer/go-todo-rest-api-example; \
    go get -u github.com/gorilla/mux; \
    go get -u github.com/jinzhu/gorm; \
    go get -u github.com/go-sql-driver/mysql

WORKDIR ${GOPATH}/src/github.com/mingrammer/go-todo-rest-api-example
COPY go-todo-rest-api-example/ ${GOPATH}/src/github.com/mingrammer/go-todo-rest-api-example/

RUN go build -o ./go-todo-rest-api-example

EXPOSE 3000