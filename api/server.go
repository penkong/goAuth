package api

import (
	"fmt"
	"net/http"

	"github.com/penkong/goAuth/controllers"
	token "github.com/penkong/goAuth/services"
	"github.com/penkong/goAuth/util"

	// db "github.com/penkong/goAuth/db/sqlc"
	// "github.com/techschool/simplebank/util"
	"github.com/julienschmidt/httprouter"
)

// Server serves HTTP requests for our banking service.
type Server struct {
	config util.Config
	// store      db.Store
	tokenMaker token.Maker
	r          *httprouter.Router
}

// NewServer creates a new HTTP server and set up routing.
func NewServer(config util.Config) (*Server, error) {
	tokenMaker, err := token.NewJWTMaker(config.TokenSymmetricKey)
	if err != nil {
		return nil, fmt.Errorf("cannot create token maker: %w", err)
	}

	server := &Server{
		config:     config,
		tokenMaker: tokenMaker,
	}

	server.setupRouter()
	return server, nil
}

func (server *Server) setupRouter() {
	r := httprouter.New()
	uc := controllers.NewAuthController()
	r.POST("/api/v1/auth/login", uc.Login)
	r.POST("/api/v1/auth/signup", uc.Signup)
	r.GET("/api/v1/auth/logout", uc.Logout)
	server.r = r
}

// Start runs the HTTP server on a specific address.
func (server *Server) Start() error {
	return http.ListenAndServe(server.config.ServerAddress, server.r)
}
