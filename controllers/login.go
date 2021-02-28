package controllers

import (
	"fmt"
	"net/http"

	"github.com/julienschmidt/httprouter"
)

func (ac AuthController) Login(w http.ResponseWriter, r *http.Request, p httprouter.Params) {
	fmt.Println(r)
}
