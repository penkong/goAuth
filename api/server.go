package api

import (
	"fmt"
	"net/http"

	"github.com/julienschmidt/httprouter"
	"github.com/rs/cors"

	"github.com/penkong/goAuth/controller"
	"github.com/penkong/goAuth/db/pgdb"
	"github.com/penkong/goAuth/services"
	"github.com/penkong/goAuth/util"
)

// Server serves HTTP requests for auth service.
type Server struct {
	c  util.Config
	s  pgdb.Store
	tm services.Maker
	r  *httprouter.Router
}

// NewServer creates a new HTTP server and set up routing.
func NewServer(c util.Config, s pgdb.Store) (*Server, error) {
	tm, err := services.NewJWTMaker("436546456435983958349634853hgfhfghfghfghfghfghfg")
	if err != nil {
		return nil, fmt.Errorf("cannot create token maker: %w", err)
	}

	server := &Server{
		c:  c,
		s:  s,
		tm: tm,
	}

	server.setupRouter()
	return server, nil
}

// SetupRouter register routers for server consumption.
func (server *Server) setupRouter() {
	r := httprouter.New()

	uc := controller.NewAuthCtrl()

	r.GET("/v1/auth/login", uc.Login)
	r.POST("/v1/auth/signup", uc.Signup)
	r.GET("/v1/auth/logout", uc.Logout)

	server.r = r
}

// Start runs the HTTP server on a specific address.
func (server *Server) Start() error {
	handler := cors.Default().Handler(server.r)
	fmt.Println("Server Start!")
	return http.ListenAndServe(":5000", handler)
}
