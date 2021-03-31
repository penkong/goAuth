// Code generated by sqlc. DO NOT EDIT.

package pgdb

import (
	"context"
	"database/sql"

	"github.com/google/uuid"
)

type Querier interface {
	CreateAppBasic(ctx context.Context, arg CreateAppBasicParams) (CreateAppBasicRow, error)
	CreateBankAccountAllBasic(ctx context.Context, arg CreateBankAccountAllBasicParams) error
	CreateBankAccountBasic(ctx context.Context, arg CreateBankAccountBasicParams) (int64, error)
	CreateBusinessLogs(ctx context.Context, arg CreateBusinessLogsParams) error
	CreateCompanyBasic(ctx context.Context, arg CreateCompanyBasicParams) (CreateCompanyBasicRow, error)
	CreateCreds(ctx context.Context, arg CreateCredsParams) (CreateCredsRow, error)
	CreateIndustryBasic(ctx context.Context, arg CreateIndustryBasicParams) (CreateIndustryBasicRow, error)
	CreatePositionBasic(ctx context.Context, arg CreatePositionBasicParams) (CreatePositionBasicRow, error)
	CreateRoleBasic(ctx context.Context, arg CreateRoleBasicParams) (CreateRoleBasicRow, error)
	CreateStatusBasic(ctx context.Context, arg CreateStatusBasicParams) (CreateStatusBasicRow, error)
	CreateTeamBasic(ctx context.Context, arg CreateTeamBasicParams) (CreateTeamBasicRow, error)
	CreateTeamsAppsCompanies(ctx context.Context, arg CreateTeamsAppsCompaniesParams) (CreateTeamsAppsCompaniesRow, error)
	CreateUserBasic(ctx context.Context, arg CreateUserBasicParams) (CreateUserBasicRow, error)
	CreateUserInfoBasic(ctx context.Context, arg CreateUserInfoBasicParams) (CreateUserInfoBasicRow, error)
	CreateUserLog(ctx context.Context, arg CreateUserLogParams) error
	CreateUserRoleAppCompany(ctx context.Context, arg CreateUserRoleAppCompanyParams) error
	CreateUserRoleAppPositionTeamCompany(ctx context.Context, arg CreateUserRoleAppPositionTeamCompanyParams) error
	DeleteApp(ctx context.Context, appID int64) error
	DeleteBankAccount(ctx context.Context, bankAccountID int64) error
	DeleteBankAccountAll(ctx context.Context, bankAccountAllID uuid.UUID) error
	DeleteCompany(ctx context.Context, companyID int32) error
	DeleteIndustry(ctx context.Context, industryID int64) error
	DeletePosition(ctx context.Context, positionID int64) error
	DeleteRole(ctx context.Context, roleID int64) error
	DeleteStatus(ctx context.Context, industryID int64) error
	DeleteTeam(ctx context.Context, teamID int64) error
	DeleteTeamsAppsCompanies(ctx context.Context, teamAppCompanyID int64) error
	GetAppById(ctx context.Context, appID int64) (GetAppByIdRow, error)
	GetAppByName(ctx context.Context, app string) (GetAppByNameRow, error)
	GetApps(ctx context.Context) ([]GetAppsRow, error)
	GetBanAccountAllById(ctx context.Context, bankAccountAllID uuid.UUID) (GetBanAccountAllByIdRow, error)
	GetCompanies(ctx context.Context, arg GetCompaniesParams) ([]GetCompaniesRow, error)
	GetCompanyById(ctx context.Context, companyID int32) (GetCompanyByIdRow, error)
	GetCompanyByName(ctx context.Context, company string) (GetCompanyByNameRow, error)
	GetIndustries(ctx context.Context) ([]GetIndustriesRow, error)
	GetIndustryById(ctx context.Context, industryID int64) (GetIndustryByIdRow, error)
	GetIndustryByName(ctx context.Context, industry string) (GetIndustryByNameRow, error)
	GetPositionByDepartment(ctx context.Context, department string) (GetPositionByDepartmentRow, error)
	GetPositionById(ctx context.Context, positionID int64) (GetPositionByIdRow, error)
	GetPositionByName(ctx context.Context, position string) (GetPositionByNameRow, error)
	GetPositions(ctx context.Context) ([]GetPositionsRow, error)
	GetRoleById(ctx context.Context, roleID int64) (GetRoleByIdRow, error)
	GetRoleByName(ctx context.Context, role string) (GetRoleByNameRow, error)
	GetRoles(ctx context.Context) ([]GetRolesRow, error)
	GetStatusById(ctx context.Context, statusID int64) (GetStatusByIdRow, error)
	GetStatusByName(ctx context.Context, status sql.NullString) (GetStatusByNameRow, error)
	GetStatuses(ctx context.Context) ([]GetStatusesRow, error)
	GetTeamById(ctx context.Context, teamID int64) (GetTeamByIdRow, error)
	GetTeamByName(ctx context.Context, team string) (GetTeamByNameRow, error)
	GetTeams(ctx context.Context, arg GetTeamsParams) ([]GetTeamsRow, error)
	GetTeamsAppsCompanies(ctx context.Context, arg GetTeamsAppsCompaniesParams) ([]GetTeamsAppsCompaniesRow, error)
	GetTeamsAppsCompaniesById(ctx context.Context, teamAppCompanyID int64) (GetTeamsAppsCompaniesByIdRow, error)
	UpdateAppById(ctx context.Context, arg UpdateAppByIdParams) (UpdateAppByIdRow, error)
	UpdateAppByName(ctx context.Context, arg UpdateAppByNameParams) (UpdateAppByNameRow, error)
	UpdateAppByPaid(ctx context.Context, arg UpdateAppByPaidParams) (UpdateAppByPaidRow, error)
	UpdateAppEnvs(ctx context.Context, arg UpdateAppEnvsParams) (UpdateAppEnvsRow, error)
	UpdateBankAccount(ctx context.Context, arg UpdateBankAccountParams) error
	UpdateBankAccountAll(ctx context.Context, arg UpdateBankAccountAllParams) error
	UpdateCompanyBankAccount(ctx context.Context, arg UpdateCompanyBankAccountParams) (UpdateCompanyBankAccountRow, error)
	UpdateCompanyById(ctx context.Context, arg UpdateCompanyByIdParams) (UpdateCompanyByIdRow, error)
	UpdatePostionById(ctx context.Context, arg UpdatePostionByIdParams) (UpdatePostionByIdRow, error)
	UpdateRoleById(ctx context.Context, arg UpdateRoleByIdParams) (UpdateRoleByIdRow, error)
	UpdateRoleByName(ctx context.Context, arg UpdateRoleByNameParams) (UpdateRoleByNameRow, error)
	UpdateSatusById(ctx context.Context, arg UpdateSatusByIdParams) (UpdateSatusByIdRow, error)
	UpdateSatusByName(ctx context.Context, arg UpdateSatusByNameParams) (UpdateSatusByNameRow, error)
	UpdateTeamAppCompany(ctx context.Context, arg UpdateTeamAppCompanyParams) (UpdateTeamAppCompanyRow, error)
	UpdateTeamById(ctx context.Context, arg UpdateTeamByIdParams) (UpdateTeamByIdRow, error)
	UpdateTeamByName(ctx context.Context, arg UpdateTeamByNameParams) (UpdateTeamByNameRow, error)
}

var _ Querier = (*Queries)(nil)
