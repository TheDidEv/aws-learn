FROM golang:1.25.5-alpha3.20 AS build

WORKDIR /app

COPY go.mod ./
COPY go.sum ./
RUN go mod download

COPY *.go ./

RUN go build -o /aws-lern

FROM gcr.io/distroless/base-debian10

WORKDIR /

COPY --from=build /aws-lern /aws-lern

USER nonroot:nonroot