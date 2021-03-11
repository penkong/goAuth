package db

import (
	"context"
	"database/sql"
	"testing"

	"github.com/penkong/goAuth/util"
	"github.com/stretchr/testify/require"
)

func createUserInfoHere(t *testing.T) UsersInfo {
	info := CreateUserInfoParams{
		FirstName: sql.NullString{String: util.RandomUserName()},
		LastName: sql.NullString{String: util.RandomUserName()},
	}
	
	usrInfo, err := testQueries.CreateUserInfo(context.Background(),info)
	
	require.NoError(t, err)
	require.NotEmpty(t, usrInfo)
	return usrInfo
}

func TestCreateUser(t *testing.T) {

	usrInfo := createUserInfoHere(t)
	arg := CreateUserParams{
		Email: util.RandomEmail(),
		Username: util.RandomUserName(),
		HashedPass: util.RandomHashePass(),
		UserInfoID: int64(usrInfo.ID),
		Rv: sql.NullInt32{Int32: 0},
	}

	usr,err := testQueries.CreateUser(context.Background(),arg)

	require.NoError(t, err)
	require.NotEmpty(t, usr)

	require.Equal(t, arg.Email , usr.Email)
	require.Equal(t, arg.Username , usr.Username)
	require.Equal(t, arg.HashedPass , usr.HashedPass)	
	require.NotZero(t, usr.ID)
	require.NotZero(t, usr.CreatedAt)

}