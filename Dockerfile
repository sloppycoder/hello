FROM golang:1.13-alpine as builder
ENV GOSUMDB off
COPY . /src
WORKDIR /src
RUN go build -o app ./cmd/srv

FROM alpine
CMD ["./app"]
COPY --from=builder /src/app .
