FROM golang:1.13-alpine as builder

# disable GOSUMDB due to some upstream package problem
ENV GOSUMDB off

COPY . /src
WORKDIR /src
RUN go build -o srv ./cmd/srv && \
    go build -o cli ./cmd/cli

FROM alpine
CMD ["/srv"]
COPY --from=builder /src/srv /src/cli /

