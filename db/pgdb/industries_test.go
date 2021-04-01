package pgdb

import (
	"context"
	"database/sql"
	"testing"

	"github.com/penkong/goAuth/util"
	"github.com/stretchr/testify/require"
)

func createRanodmIndustry(t *testing.T) (CreateIndustryBasicRow, CreateIndustryBasicParams, error) {
	arg := CreateIndustryBasicParams{
		Industry: util.RandomString(5),
		HowClean: int32(util.RandomInt(0, 5)),
		Rv:       sql.NullInt32{},
	}

	i, err := testQueries.CreateIndustryBasic(context.Background(), arg)

	require.NoError(t, err)
	require.NotEmpty(t, i)

	require.Equal(t, arg.Industry, i.Industry)
	require.Equal(t, arg.HowClean, i.HowClean)

	require.NotZero(t, i.IndustryID)
	require.NotZero(t, i.CreatedAt)

	return i, arg, err
}

func deleteRandomIndustry(i int64) (DeleteIndustryRow,error) {
	return testQueries.DeleteIndustry(context.Background(), i)
}

func TestCreateIndustryBasic(t *testing.T)  {
	i, arg, err := createRanodmIndustry(t)
	require.NoError(t, err)
	require.NotEmpty(t, i)

	require.Equal(t, arg.Industry, i.Industry)
	require.Equal(t, arg.HowClean, i.HowClean)

	require.NotZero(t, i.IndustryID)
	require.NotZero(t, i.CreatedAt)

	_, err = deleteRandomIndustry(i.IndustryID)

	require.NoError(t, err)
}

func TestDeleteIndustry(t *testing.T) {
	i, arg, err := createRanodmIndustry(t)

	require.NoError(t, err)
	require.NotEmpty(t, i)

	require.Equal(t, arg.Industry, i.Industry)
	require.Equal(t, arg.HowClean, i.HowClean)

	require.NotZero(t, i.IndustryID)
	require.NotZero(t, i.CreatedAt)

	ig, err := deleteRandomIndustry(i.IndustryID)

	require.NoError(t, err)
	require.NotEmpty(t, ig)
	
}
func TestGetIndustries(t *testing.T)  {}

func TestGetIndustryById(t *testing.T)    {
	i, _, err := createRanodmIndustry(t)
	ig, err := testQueries.GetIndustryById(context.Background(), i.IndustryID)

	require.NoError(t, err)
	require.NotEmpty(t, ig)
}
func TestGetIndustryByName(t *testing.T)  {}
func TestUpdateIndustryById(t *testing.T) {}
