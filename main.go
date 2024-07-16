package main

import (
	"fmt"
	"net/http"
)

func main() {
	http.HandleFunc("/", HelloSrv)
	http.ListenAndServe(":8000", nil)
}

func HelloSrv(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Hello from inside an auto-deployed container!")
}
