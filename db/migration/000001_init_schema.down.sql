-- info tables + admin creations
DROP TABLE IF EXISTS "industries" CASCADE;
DROP TABLE IF EXISTS "statuses" CASCADE;
DROP TABLE IF EXISTS "roles" CASCADE;
DROP TABLE IF EXISTS "positions" CASCADE;

DROP TABLE IF EXISTS "apps" CASCADE;
DROP TABLE IF EXISTS "teams" CASCADE;
DROP TABLE IF EXISTS "companies" CASCADE;

-- conjunction info tables
DROP TABLE IF EXISTS "teams_companies" CASCADE;
DROP TABLE IF EXISTS "teams_apps" CASCADE;

DROP TABLE IF EXISTS "companies_apps" CASCADE;

-- onCreation tables
DROP TABLE IF EXISTS "creds" CASCADE;
DROP TABLE IF EXISTS "users_info" CASCADE;
DROP TABLE IF EXISTS "users" CASCADE;
DROP TABLE IF EXISTS "bank_account" CASCADE;
DROP TABLE IF EXISTS "bank_account_all" CASCADE;

-- conjunction tables on creation
DROP TABLE IF EXISTS "users_roles" CASCADE; 
DROP TABLE IF EXISTS "users_teams" CASCADE; 
DROP TABLE IF EXISTS "users_apps"CASCADE; 
DROP TABLE IF EXISTS "users_positions"  CASCADE; 
DROP TABLE IF EXISTS "users_companies" CASCADE; 


-- log tables
DROP TABLE IF EXISTS "user_logs" CASCADE;
DROP TABLE IF EXISTS "business_logs" CASCADE;
