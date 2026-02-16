FROM golang:1.23-alpine AS build
RUN echo 'package main; import "net/http"; func main() { http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) { w.Write([]byte("ok")) }); http.ListenAndServe(":8080", nil) }' > main.go
RUN CGO_ENABLED=0 go build -o /app main.go
FROM scratch
COPY --from=build /app /app
EXPOSE 8080
CMD ["/app"]
