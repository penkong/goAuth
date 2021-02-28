package main

import (
	"database/sql"

	_ "github.com/lib/pq"
	"github.com/penkong/goAuth/util"
	// "github.com/penkong/goAuth/api"
	// db "github.com/penkong/goAuth/db/sqlc"
	// "github.com/penkong/goAuth/util"
)

var db *sql.DB

func main() {
	config, err := util.LoadConfig('.')
	
}