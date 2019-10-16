package main

import (
	"log"
	"net/http"

	"github.com/rakyll/statik/fs"
	_ "github.com/rsp9u/vue-go-template/statik"
)

func main() {
	fs, _ := fs.New()
	http.Handle("/", http.StripPrefix("/", http.FileServer(fs)))
	log.Fatal(http.ListenAndServe(":8080", nil))
}
