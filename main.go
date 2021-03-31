package main

import (
	"database/sql"
	"fmt"
	"log"

	_ "github.com/lib/pq"
	"github.com/penkong/goAuth/api"

	// db "github.com/penkong/goAuth/db/pgdb"
	"github.com/penkong/goAuth/util"
)

var db *sql.DB

func main() {

	// Load up config files with viper
	config, err := util.LoadConfig(".")
	if err != nil {
		log.Fatal("cannot load config:", err)
	}

	// Open connection to database in this case Postgres13
	_, err = sql.Open(config.DBDriver, config.DBSource)
	if err != nil {
		log.Fatal("db not connected!!!", err)
	}


	// Create new Store - DB logic

	// Create Server Instance
	server, err := api.NewServer()
	if err != nil {
		log.Fatal("server creation error!!!", err)
	}
	fmt.Println("server connected!!!")
	// Start up server on port 5050
	err = server.Start()
	if err != nil {
		log.Fatal("server start problem", err)
	}
}
