package pgdb

import (
	"context"
	"database/sql"
	"fmt"
)

// store provide all funcs to exec db queries(Queries struct) and transactions
type Store struct {
	// composition
	// all queries will be available for store also
	*Queries
	// add more functionality here to support transactions
	// need to create transactions
	db *sql.DB
}

var txKey = struct{}{}

func NewStore(db *sql.DB) *Store {
	return &Store{
		db: db,
		// New generated by sqlc
		Queries: New(db),
	}
}

// to generate and execution of transactions it create new queries object
// with transaction and call  the cb with the created queries and finally commit
// or rollback
// for each specific transaction we use exported func not this
func (store *Store) execTx(ctx context.Context, fn func(*Queries) error) error {
	// option allow us to set a custom isolation level for transaction
	// &sql.TxOptions{}
	tx, err := store.db.BeginTx(ctx, nil)
	if err != nil {
		return err
	}

	q := New(tx)

	err = fn(q)

	if err != nil {
		if rollErr := tx.Rollback(); rollErr != nil {
			return fmt.Errorf("transaction error : %v, rollback error : %v", err, rollErr)
		}
		return err
	}

	return tx.Commit()
}

// for each specific transaction we use exported func not this
// example Transaction
// it is transaction and do multi things
type ExampleTxParams struct {
	Field1 string
	Field2 string
}

type ExampleTxResult struct {}

// dead lock 

func (store *Store) ExampleTx(ctx context.Context, arg ExampleTxParams) (ExampleTxResult, error) {
	var res ExampleTxResult

	err := store.execTx(ctx, func(q *Queries) error {
		txName := ctx.Value(txKey)
		fmt.Println(txName, "created")
		var err error
		// res.Field1, err = q.CreateAppBasic(ctx, ExampleTxParams{
		// 	//
		// })
		if err != nil {
			return err
		}
		// res.Field2, err = q.CreateAppBasic(ctx, ExampleTxParams{
		// 	//
		// })
		// ...
		// lock mechnism
		// use for update at end of query statment

		return nil
	})


	return res, err
}