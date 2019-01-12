FROM golang:latest as builder

MAINTAINER Didi Dwi Novianto <me@dididwinovianto.com>
RUN mkdir -p ${GOPATH}/src/github.com/mingrammer/go-todo-rest-api-example; \
    go get -u github.com/gorilla/mux; \
    go get -u github.com/jinzhu/gorm; \
    go get -u github.com/go-sql-driver/mysql

WORKDIR ${GOPATH}/src/github.com/mingrammer/go-todo-rest-api-example
COPY go-todo-rest-api-example/ ${GOPATH}/src/github.com/mingrammer/go-todo-rest-api-example/

RUN CGO_ENABLED=0 GOOS=linux go build -o ./go-todo-rest-api-example

FROM alpine:latest
RUN apk --no-cache add ca-certificates

WORKDIR /app
COPY --from=builder /go/src/github.com/mingrammer/go-todo-rest-api-example/go-todo-rest-api-example .

EXPOSE 3000
ENTRYPOINT [ "/app/go-todo-rest-api-example" ]