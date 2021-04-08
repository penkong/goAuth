package pgdb

// import (
// 	"context"
// 	"fmt"
// 	"testing"

// 	"github.com/stretchr/testify/require"
// )

// func TestExampleTx(t *testing.T) {
// 	store := NewStore(testDB)

// 	// create objeccts
// 	// run several conccurent go routines 20
// 	n := 20

// 	errors := make(chan error)
// 	results := make(chan ExampleTxResult)

// 	for i := 0; i < n; i++ {
// 		txName := fmt.Sprintf("tx %d" , i+ 1)
// 		go func() {
// 			ctx := context.WithValue(context.Background(), txKey, txName)
// 			res, err := store.ExampleTx(ctx, ExampleTxParams{})
// 			errors <- err
// 			results <- res
// 		}()
// 	}

// 	for i := 0; i<n; i++ {
// 		err := <-errors
// 		require.NoError(t,err)

// 		res := <-results
// 		require.NotEmpty(t,res)
// 	}
// }