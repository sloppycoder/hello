FROM golang:1.13 as builder

WORKDIR /build
ADD . /build

# this module has some problemw with checksum
ENV GONOSUMBDB "github.com/lucas-clemente/*"

RUN go build -o /build/srv ./cmd/srv && \
    go build -o /build/cli ./cmd/cli

FROM gcr.io/distroless/base
ENV MICRO_REGISTRY kubernetes
COPY --from=builder /build/srv /build/cli /
CMD ["/srv"]
