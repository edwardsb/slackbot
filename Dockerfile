FROM golang:alpine3.15
WORKDIR src
COPY . .
RUN go build main.go