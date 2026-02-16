FROM golang:1.23-alpine AS build
WORKDIR /src
COPY go.mod main.go ./
RUN CGO_ENABLED=0 go build -o /app main.go

FROM alpine:3.19
COPY --from=build /app /app
EXPOSE 80
CMD ["/app"]