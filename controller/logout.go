package controller

import (
	"net/http"

	"github.com/julienschmidt/httprouter"
)

func (ac AuthCtrl) Logout(w http.ResponseWriter, r *http.Request, p httprouter.Params) {}
