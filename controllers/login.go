package controllers

import (
	"encoding/json"
	"fmt"
	"log"
	"net/http"

	"github.com/julienschmidt/httprouter"
)

// Login is something
func (ac AuthController) Login(w http.ResponseWriter, r *http.Request, p httprouter.Params) {
	fmt.Println(r)
	d := "hello"
	err := json.NewEncoder(w).Encode(d)
	if err != nil {
		log.Fatal(err)
	}
}
