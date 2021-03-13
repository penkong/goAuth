// Code generated by sqlc. DO NOT EDIT.

package db

import (
	"context"
)

type Querier interface {
	CreateCredFirst(ctx context.Context, hashedPass string) (Cred, error)
	CreateIndustry(ctx context.Context, arg CreateIndustryParams) (Industry, error)
	CreateRole(ctx context.Context, arg CreateRoleParams) (Role, error)
	CreateUserBaseInfo(ctx context.Context, arg CreateUserBaseInfoParams) (UsersInfo, error)
}

var _ Querier = (*Queries)(nil)
