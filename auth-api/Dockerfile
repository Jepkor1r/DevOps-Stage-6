FROM golang:1.20-alpine AS build
WORKDIR /src
COPY go.mod go.sum ./
RUN go mod download
COPY . .
RUN go build -o /bin/auth ./cmd/auth

FROM alpine:3.18
COPY --from=build /bin/auth /bin/auth
EXPOSE 8080
CMD ["/bin/auth"]