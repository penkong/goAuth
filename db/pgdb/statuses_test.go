package pgdb

import (
	"context"
	"database/sql"
	"testing"
	"time"

	"github.com/penkong/goAuth/util"
	"github.com/stretchr/testify/require"
)

func createRandomStatus(t *testing.T) (CreateStatusBasicRow, CreateStatusBasicParams) {
	arg := CreateStatusBasicParams{
		Status: util.RandomString(7),
		Rv:     0,
	}

	sc, err := testQueries.CreateStatusBasic(context.Background(), arg)

	require.NoError(t, err)
	require.NotEmpty(t, sc)

	require.Equal(t, arg.Status, sc.Status)

	require.NotZero(t, sc.StatusID)
	require.NotZero(t, sc.CreatedAt)

	return sc, arg
}

func deleteRandomStatus(t *testing.T, i int64) {
	sdel, err := testQueries.DeleteStatus(context.Background(), i)

	require.NoError(t, err)
	require.NotEmpty(t, sdel)

	require.NotZero(t, sdel.StatusID)

	require.Equal(t, sdel.Deleted, sql.NullBool(sql.NullBool{Bool: true, Valid: true}))
	require.Equal(t, sdel.DeletedAt, sql.NullTime(sql.NullTime{Time: sdel.DeletedAt.Time, Valid: true}))
}

func TestCreateStatusBasic(t *testing.T) {
	sc, _ := createRandomStatus(t)
	deleteRandomStatus(t, sc.StatusID)
}

func TestDeleteStatus(t *testing.T) {
	sc, _ := createRandomStatus(t)
	deleteRandomStatus(t, sc.StatusID)
}

func TestGetStatusById(t *testing.T) {
	is, _ := createRandomStatus(t)

	ig, err := testQueries.GetStatusById(context.Background(), is.StatusID)

	require.NoError(t, err)
	require.NotEmpty(t, ig)
	require.NotZero(t, ig.CreatedAt)
	require.WithinDuration(t, is.CreatedAt, ig.CreatedAt, time.Second)

	deleteRandomIndustry(t, ig.StatusID)
}

func TestGetStatusByName(t *testing.T) {}

func TestGetStatuses(t *testing.T) {}

func TestUpdateStatusById(t *testing.T) {}

func TestUpdateStatusByName(t *testing.T) {}
