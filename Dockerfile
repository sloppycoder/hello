FROM golang:1.13 as builder

WORKDIR /build
ADD . /build

RUN go build -o /build/srv ./cmd/srv && \
    go build -o /build/cli ./cmd/cli

FROM gcr.io/distroless/base
COPY --from=builder /build/srv /build/cli /
CMD ["/srv"]
