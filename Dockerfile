FROM golang:latest as builder
WORKDIR /app
COPY go.mod ./
RUN go mod download
COPY *.go ./
RUN CGO_ENABLED=0 GOOS=linux GOARCH=arm64 go build -o /demoserver

FROM --platform=linux/arm64 scratch
COPY --from=builder /demoserver /demoserver
ENTRYPOINT ["/demoserver"]
EXPOSE 8000
