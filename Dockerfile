FROM golang:alpine as build-env
COPY . /src
WORKDIR /src
RUN go build -o gowon-qwantz

FROM alpine:3.14.3
WORKDIR /app
COPY --from=build-env /src/gowon-qwantz /app/
ENTRYPOINT ["./gowon-qwantz"]
