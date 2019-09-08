FROM golang:1.13-alpine as builder
ENV GOSUMDB off
COPY . /src
WORKDIR /src
RUN go build -o app ./cmd/srv
RUN go build -o cli ./cmd/cli

FROM alpine
CMD ["./app"]
COPY --from=builder /src/app .
COPY --from=builder /src/cli .
