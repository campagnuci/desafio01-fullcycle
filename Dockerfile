FROM golang:alpine3.15 AS build

WORKDIR /usr/src/

COPY src/ /usr/src/

RUN go build main.go

FROM scratch

WORKDIR /usr/src

COPY --from=build /usr/src /usr/src

ENTRYPOINT  ["./main"]
