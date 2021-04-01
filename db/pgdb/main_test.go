// test need talk to db , we have to setup connection and the queries object first
package pgdb

import (
	"database/sql"
	"log"
	"os"
	"testing"

	_ "github.com/lib/pq"
)

const (
	dbDriver = "postgres"
	dbSource = "postgresql://root:secret@localhost:5432/authservice?sslmode=disable"
)

var testQueries *Queries

// TestMain is mian entry point for all test inside a package
func TestMain(m *testing.M) {
	conn, err := sql.Open(dbDriver, dbSource)
	if err != nil {
		log.Fatal("cannot connect to db", err)
	}

	testQueries = New(conn)
	os.Exit(m.Run())
}
