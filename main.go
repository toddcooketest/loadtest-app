package main

import (
	"fmt"
	"net/http"
)

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprint(w, "ok")
	})
	fmt.Println("Listening on :80")
	http.ListenAndServe(":80", nil)
}
