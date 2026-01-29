FROM golang:alpine AS builder

WORKDIR /go/src/github.com/nuso/k8s-job-notify
ADD . /go/src/github.com/nuso/k8s-job-notify
RUN go build -o /app .

FROM alpine:3.23.3

COPY --from=builder /app /app
ENTRYPOINT ["/app"]
