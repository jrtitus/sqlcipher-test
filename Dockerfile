FROM golang:1.22-alpine3.20 AS base

ARG TARGETOS
ARG TARGETARCH

RUN apk update && apk add --no-cache build-base openssl openssl-dev sqlite

WORKDIR /app

COPY go.* ./

RUN go mod download all

COPY main.go .

FROM base AS build

RUN CGO_ENABLED=1 GOOS=${TARGETOS} GOARCH=${TARGETARCH} go build -ldflags="-s -w" -o /app/main main.go

FROM alpine:3.20 AS prod

WORKDIR /app
COPY --from=build /app/main .
CMD [ "/app/main" ]