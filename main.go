package main

import (
	"database/sql"
	"log"

	_ "github.com/lib/pq"

	"github.com/penkong/goAuth/api"
	"github.com/penkong/goAuth/db/pgdb"
	"github.com/penkong/goAuth/util"
)

func main() {

	// Load up config files with viper
	conf, err := util.LoadConfig(".")
	if err != nil {
		log.Fatal("cannot load config:", err)
	}

	// Open connection to database in this case Postgres13
	conn, err := sql.Open(conf.DBDriver, conf.DBSource)
	if err != nil {
		log.Fatal("db not connected!!!", err)
	}

	// Create new Store with transactions for queries - DB logic
	store := pgdb.NewStore(conn)
	
	// Create Server Instance
	server, err := api.NewServer(conf, store)
	if err != nil {
		log.Fatal("server creation error!!!", err)
	}

	// Start up server on port 5050
	err = server.Start()
	if err != nil {
		log.Fatal("server start problem", err)
	}

}
