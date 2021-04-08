package api

import (
	"fmt"
	"net/http"

	ctrls "github.com/penkong/goAuth/controllers"
	"github.com/penkong/goAuth/services"
	"github.com/penkong/goAuth/util"

	"github.com/julienschmidt/httprouter"
	"github.com/rs/cors"
)

// Server serves HTTP requests for auth service.
type Server struct {
	conf util.Config
	// store  pgdb.Store
	tm     services.Maker
	r      *httprouter.Router
}

// NewServer creates a new HTTP server and set up routing.
func NewServer(c util.Config) (*Server, error) {
	tm, err := services.NewJWTMaker("436546456435983958349634853hgfhfghfghfghfghfghfg")
	if err != nil {
		return nil, fmt.Errorf("cannot create token maker: %w", err)
	}

	server := &Server{
		conf: c,
		tm:     tm,
	}

	server.setupRouter()
	return server, nil
}

// SetupRouter register routers for server consumption.
func (server *Server) setupRouter() {
	r := httprouter.New()

	uc := ctrls.NewAuthController()

	r.POST("/v1/auth/login", uc.Login)
	r.POST("/v1/auth/signup", uc.Signup)
	r.GET("/v1/auth/logout", uc.Logout)

	server.r = r
}

// Start runs the HTTP server on a specific address.
func (server *Server) Start() error {
	handler := cors.Default().Handler(server.r)
	return http.ListenAndServe(":5000", handler)
}
