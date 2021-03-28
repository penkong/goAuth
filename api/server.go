package api

import (
	"fmt"
	"net/http"

	"github.com/penkong/goAuth/controllers"
	token "github.com/penkong/goAuth/services"

	"github.com/rs/cors"

	// db "github.com/penkong/goAuth/db/sqlc"
	// "github.com/techschool/simplebank/util"
	"github.com/julienschmidt/httprouter"
)

// Server serves HTTP requests for our banking service.
type Server struct {
	// config util.Config
	// store      db.Store
	tokenMaker token.Maker
	r          *httprouter.Router
}

// NewServer creates a new HTTP server and set up routing.
func NewServer() (*Server, error) {
	tokenMaker, err := token.NewJWTMaker("436546456435983958349634853hgfhfghfghfghfghfghfg")
	if err != nil {
		return nil, fmt.Errorf("cannot create token maker: %w", err)
	}

	server := &Server{
		// config:     config,
		tokenMaker: tokenMaker,
	}

	server.setupRouter()
	return server, nil
}

func (server *Server) setupRouter() {
	r := httprouter.New()
	uc := controllers.NewAuthController()
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
