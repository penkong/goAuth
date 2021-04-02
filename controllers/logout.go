package ctrls

import (
	"net/http"

	"github.com/julienschmidt/httprouter"
)

func (ac AuthController) Logout(w http.ResponseWriter, r *http.Request, p httprouter.Params) {}
