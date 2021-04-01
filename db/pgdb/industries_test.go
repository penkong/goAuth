package pgdb

import (
	"context"
	"database/sql"
	"testing"
	"time"

	"github.com/penkong/goAuth/util"
	"github.com/stretchr/testify/require"
)

func createRanodmIndustry(t *testing.T) (CreateIndustryBasicRow, CreateIndustryBasicParams) {

	arg := CreateIndustryBasicParams{
		Industry: util.RandomString(5),
		HowClean: int32(util.RandomInt(0, 5)),
		Rv:       0,
	}

	i, err := testQueries.CreateIndustryBasic(context.Background(), arg)
	require.NoError(t, err)
	require.NotEmpty(t, i)

	require.Equal(t, arg.Industry, i.Industry)
	require.Equal(t, arg.HowClean, i.HowClean)

	require.NotZero(t, i.IndustryID)
	require.NotZero(t, i.CreatedAt)

	return i, arg
}

func deleteRandomIndustry(t *testing.T, i int64) {
	idel, err := testQueries.DeleteIndustry(context.Background(), i)

	require.NoError(t, err)
	require.NotEmpty(t, idel)

	require.NotZero(t, idel.IndustryID)

	require.Equal(t, idel.Deleted, sql.NullBool(sql.NullBool{Bool: true, Valid: true}))
	require.Equal(t, idel.DeletedAt, sql.NullTime(sql.NullTime{Time: idel.DeletedAt.Time, Valid: true}))
}

func TestCreateIndustryBasic(t *testing.T) {
	ic, _ := createRanodmIndustry(t)
	deleteRandomIndustry(t, ic.IndustryID)
}

func TestDeleteIndustry(t *testing.T) {
	ic, _ := createRanodmIndustry(t)
	deleteRandomIndustry(t, ic.IndustryID)
}

func TestGetIndustries(t *testing.T) {

	var icList []CreateIndustryBasicRow

	for i := 0; i < 10; i++ {
		ic, _ := createRanodmIndustry(t)
		icList = append(icList, ic)
	}

	args := GetIndustriesParams{
		Limit:  8,
		Offset: 8,
	}

	igList, err := testQueries.GetIndustries(context.Background(), args)

	require.NoError(t, err)
	require.Len(t, igList, 8)

	for _, industry := range igList {
		require.NotEmpty(t, industry)
	}

	for _, v := range icList {
		deleteRandomIndustry(t, v.IndustryID)
	}
}

func TestGetIndustryById(t *testing.T) {
	ic, _ := createRanodmIndustry(t)

	ig, err := testQueries.GetIndustryById(context.Background(), ic.IndustryID)

	require.NoError(t, err)
	require.NotEmpty(t, ig)
	require.WithinDuration(t, ic.CreatedAt, ig.CreatedAt, time.Second)

	deleteRandomIndustry(t, ig.IndustryID)
}

func TestGetIndustryByName(t *testing.T) {
	ic, _ := createRanodmIndustry(t)

	ig, err := testQueries.GetIndustryByName(context.Background(), ic.Industry)

	require.NoError(t, err)
	require.NotEmpty(t, ig)
	require.WithinDuration(t, ic.CreatedAt, ig.CreatedAt, time.Second)

	deleteRandomIndustry(t, ig.IndustryID)
}

func TestUpdateIndustryById(t *testing.T) {
	ic, _ := createRanodmIndustry(t)

	uarg := UpdateIndustryByIdParams{
		IndustryID: ic.IndustryID,
		Industry:   util.RandomString(7),
		HowClean:   int32(util.RandomInt(0, 5)),
	}

	iu, err := testQueries.UpdateIndustryById(context.Background(), uarg)

	require.NoError(t, err)
	require.NotEmpty(t, iu)
	require.NotEqual(t, iu.UpdatedAt, ic.CreatedAt)
	require.NotEqual(t, iu.Industry, ic.Industry)

	deleteRandomIndustry(t, iu.IndustryID)
}
