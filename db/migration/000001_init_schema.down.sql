-- info tables + admin creations
DROP TABLE IF EXISTS "industries" CASCADE;
DROP TABLE IF EXISTS "statuses" CASCADE;
DROP TABLE IF EXISTS "roles" CASCADE;
DROP TABLE IF EXISTS "positions" CASCADE;

DROP TABLE IF EXISTS "apps" CASCADE;
DROP TABLE IF EXISTS "teams" CASCADE;
DROP TABLE IF EXISTS "companies" CASCADE;

-- conjunction info tables
DROP TABLE IF EXISTS "teams_apps_companies" CASCADE;

-- onCreation tables
DROP TABLE IF EXISTS "creds" CASCADE;
DROP TABLE IF EXISTS "users_info" CASCADE;
DROP TABLE IF EXISTS "users" CASCADE;
DROP TABLE IF EXISTS "bank_account" CASCADE;
DROP TABLE IF EXISTS "bank_account_all" CASCADE;

-- conjunction tables on creation
DROP TABLE IF EXISTS "users_roles_apps_companies" CASCADE; 
DROP TABLE IF EXISTS "users_roles_apps_positions_teams_companies" CASCADE; 



-- log tables
DROP TABLE IF EXISTS "user_logs" CASCADE;
DROP TABLE IF EXISTS "business_logs" CASCADE;
