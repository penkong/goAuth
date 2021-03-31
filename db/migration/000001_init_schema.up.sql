-- UNIQUE(email, username)
-- CHECK(COALESCE(cell_phone, home_phone, work_phone) IS NOT NULL),
-- CHECK(
--   COALESCE(leader, observer, hr, tech_guy) IS NOT NULL
-- )

create extension if not exists "uuid-ossp";

SET statement_timeout = "10s";

-- --------------------------------

CREATE TABLE "industries" (
  "industry_id" BIGSERIAL PRIMARY KEY,
  "industry" varchar(50) UNIQUE NOT NULL,
  "how_clean" int NOT NULL,
  "created_at" timestamptz NOT NULL DEFAULT (now()),
  "updated_at" timestamptz,
  "deleted_at" timestamptz,
  "deleted" boolean DEFAULT false,
  "rv" integer DEFAULT 0,
  CHECK(created_at < updated_at)
);

CREATE TABLE "statuses" (
  "status_id" BIGSERIAL PRIMARY KEY,
  "status" varchar(50),
  "created_at" timestamptz NOT NULL DEFAULT (now()),
  "updated_at" timestamptz,
  "deleted_at" timestamptz,
  "deleted" boolean DEFAULT false,
  "rv" integer NOT NULL DEFAULT 0,
  CHECK(created_at < updated_at)
);

CREATE TABLE "roles" (
  "role_id" BIGSERIAL PRIMARY KEY,
  "role" varchar(30) UNIQUE NOT NULL,
  "created_at" timestamptz NOT NULL DEFAULT (now()),
  "updated_at" timestamptz,
  "deleted_at" timestamptz,
  "deleted" boolean DEFAULT false,
  "rv" integer NOT NULL DEFAULT 0,
  CHECK(created_at < updated_at)
);

CREATE TABLE "positions" (
  "position_id" BIGSERIAL PRIMARY KEY,
  "department" varchar(50) NOT NULL,
  "position" varchar(50) NOT NULL,
  "created_at" timestamptz NOT NULL DEFAULT (now()),
  "updated_at" timestamptz,
  "deleted_at" timestamptz,
  "deleted" boolean DEFAULT false,
  "rv" integer NOT NULL DEFAULT 0,
  CHECK(created_at < updated_at),
  UNIQUE(department, position)
);

CREATE TABLE "apps" (
  "app_id" BIGSERIAL PRIMARY KEY,
  "app" varchar(100) UNIQUE NOT NULL,
  "app_base_os" varchar(30) NOT NULL,
  "desktop" boolean,
  "web" boolean,
  "mobile" boolean,
  "ios" boolean,
  "android" boolean,
  "pwa" boolean,
  "paid" boolean DEFAULT false,
  "industry_id" bigint NOT NULL,
  "created_at" timestamptz NOT NULL DEFAULT (now()),
  "updated_at" timestamptz,
  "deleted_at" timestamptz,
  "deleted" boolean DEFAULT false,
  "rv" integer DEFAULT 0,
  CHECK(created_at < updated_at),
  CHECK(COALESCE(desktop, web, mobile) IS NOT NULL)
);

CREATE TABLE "teams" (
  "team_id" BIGSERIAL PRIMARY KEY,
  "team" varchar(100) NOT NULL,
  "industry_id" bigint NOT NULL,
  "created_at" timestamptz NOT NULL DEFAULT (now()),
  "updated_at" timestamptz,
  "deleted_at" timestamptz,
  "deleted" boolean DEFAULT false,
  "rv" integer NOT NULL DEFAULT 0,
  CHECK(created_at < updated_at)
);

CREATE TABLE "companies" (
  "company_id" SERIAL PRIMARY KEY,
  "company" varchar(100) NOT NULL,
  "bio" varchar(2000) NOT NULL,
  "country" varchar(50) NOT NULL,
  "region" varchar(50) NOT NULL,
  "ceo" varchar(100),
  "manager" varchar(100),
  "hr" varchar(100),
  "address" varchar(400) NOT NULL,
  "how_clean" int NOT NULL,
  "industry_id" bigint NOT NULL,
  "bank_account_all_id" UUID,
  "created_at" timestamptz NOT NULL DEFAULT (now()),
  "updated_at" timestamptz,
  "deleted_at" timestamptz,
  "deleted" boolean DEFAULT false,
  "rv" integer DEFAULT 0,
  CHECK(created_at < updated_at),
  CHECK(COALESCE(ceo, manager, hr) IS NOT NULL)
);

-- ----------------

CREATE TABLE "teams_apps_companies" (
  "team_app_company_id" BIGSERIAL PRIMARY KEY,
  "team_id" bigint,
  "app_id" bigint,
  "company_id" bigint,
  "created_at" timestamptz NOT NULL DEFAULT (now()),
  "updated_at" timestamptz,
  "deleted_at" timestamptz,
  "deleted" boolean DEFAULT false,
  "rv" integer DEFAULT 0,
  CHECK(created_at < updated_at),
  UNIQUE(team_id, app_id, company_id)
);

-- --------------------------------

CREATE TABLE "creds" (
  "cred_id" uuid DEFAULT uuid_generate_v4() PRIMARY KEY,
  "hashed_pass" varchar(200) NOT NULL,
  "created_at" timestamptz NOT NULL DEFAULT (now()),
  "updated_at" timestamptz,
  "deleted_at" timestamptz,
  "deleted" boolean DEFAULT false,
  "rv" integer NOT NULL DEFAULT 0,
  CHECK(created_at < updated_at)
);

CREATE TABLE "users_info" (
  "user_info_id" uuid DEFAULT uuid_generate_v4() PRIMARY KEY,
  "first_name" varchar(50),
  "last_name" varchar(50),
  "dob" date NOT NULL,
  "cell_phone" varchar(24),
  "home_phone" varchar(24),
  "work_phone" varchar(24),
  "avatar" varchar(200),
  "banner" varchar(200),
  "bio" varchar(2000),
  "work_address" varchar(200),
  "home_address" varchar(200),
  "current_city" varchar(75),
  "born_country" varchar(75),
  "living_country" varchar(75),
  "current_country" varchar(75),
  "zip_code" varchar(75),
  "national_number" varchar(30),
  "national_card_pic" varchar(200),
  "passport_number_type" varchar(50),
  "passport_pic" varchar(200) UNIQUE,
  "created_at" timestamptz NOT NULL DEFAULT (now()),
  "updated_at" timestamptz,
  "deleted_at" timestamptz,
  "deleted" boolean DEFAULT false,
  "rv" integer NOT NULL DEFAULT 0,
  CHECK(created_at < updated_at),
  UNIQUE(first_name, last_name, dob, born_country, living_country),
  UNIQUE(current_country, national_number),
  UNIQUE(current_country, passport_number_type)
);

CREATE TABLE "users" (
  "user_id" uuid DEFAULT uuid_generate_v4() PRIMARY KEY,
  "email" varchar(40) UNIQUE NOT NULL,
  "username" varchar(30) UNIQUE NOT NULL,
  "status_id" bigint NOT NULL DEFAULT 2,
  "cred_id" UUID UNIQUE NOT NULL,
  "bank_account_all_id" UUID UNIQUE,
  "user_info_id" UUID UNIQUE NOT NULL,
  "created_at" timestamptz NOT NULL DEFAULT (now()),
  "updated_at" timestamptz,
  "deleted_at" timestamptz,
  "deleted" boolean DEFAULT false,
  "rv" integer NOT NULL DEFAULT 0,
  CHECK(created_at < updated_at)
);

CREATE TABLE "bank_account" (
  "bank_account_id" BIGSERIAL PRIMARY KEY,
  "bank" varchar(100) NOT NULL,
  "account_number" varchar(100) NOT NULL,
  "account_type" varchar(50) NOT NULL,
  "isbn" varchar(100) UNIQUE NOT NULL,
  "created_at" timestamptz NOT NULL DEFAULT (now()),
  "updated_at" timestamptz,
  "deleted_at" timestamptz,
  "deleted" boolean DEFAULT false,
  "rv" integer NOT NULL DEFAULT 0,
  CHECK(created_at < updated_at),
  UNIQUE(bank, account_number)
);

CREATE TABLE "bank_account_all" (
  "bank_account_all_id" uuid DEFAULT uuid_generate_v4() PRIMARY KEY,
  "account_1" bigint UNIQUE,
  "account_2" bigint UNIQUE,
  "account_3" bigint UNIQUE,
  "account_4" bigint UNIQUE,
  "account_5" bigint UNIQUE,
  "created_at" timestamptz NOT NULL DEFAULT (now()),
  "updated_at" timestamptz,
  "deleted_at" timestamptz,
  "deleted" boolean DEFAULT false,
  "rv" integer DEFAULT 0,
  CHECK(created_at < updated_at),
  CHECK(COALESCE(account_1, account_2, account_3, account_4, account_5) IS NOT NULL)
);

-- --------------


CREATE TABLE "users_roles_apps_companies" (
  "user_role_app_company_id" BIGSERIAL PRIMARY KEY,
  "user_id" UUID NOT NULL,
  "role_id" bigint NOT NULL DEFAULT 3,
  "app_id" bigint NOT NULL,
  "company_id" bigint NOT NULL,
  "created_at" timestamptz NOT NULL DEFAULT (now()),
  "updated_at" timestamptz,
  "deleted_at" timestamptz,
  "deleted" boolean DEFAULT false,
  "rv" integer NOT NULL DEFAULT 0,
  CHECK(created_at < updated_at),
  UNIQUE(user_id, role_id, app_id, company_id)
);

CREATE TABLE "users_roles_apps_positions_teams_companies" (
  "user_role_app_position_team_company_id" BIGSERIAL PRIMARY KEY,
  "user_id" UUID NOT NULL,
  "role_id" bigint NOT NULL DEFAULT 3,
  "app_id" bigint NOT NULL,
  "position_id" bigint NOT NULL,
  "team_id" bigint NOT NULL,
  "company_id" bigint NOT NULL,
  "created_at" timestamptz NOT NULL DEFAULT (now()),
  "updated_at" timestamptz,
  "deleted_at" timestamptz,
  "deleted" boolean DEFAULT false,
  "rv" integer NOT NULL DEFAULT 0,
  CHECK(created_at < updated_at),
  UNIQUE(user_id, role_id, app_id, position_id, team_id, company_id)

);

-- -----------------

CREATE TABLE "user_logs" (
  "user_logs_id" BIGSERIAL PRIMARY KEY,
  "event" varchar(50) NOT NULL,
  "device" varchar(50) NOT NULL,
  "os" varchar(50) NOT NULL,
  "ip" varchar(50) NOT NULL,
  "agent" varchar(50) NOT NULL,
  "position_id" bigint NOT NULL,
  "company_id" bigint NOT NULL,
  "role_id" bigint NOT NULL,
  "team_id" bigint NOT NULL,
  "app_id" bigint NOT NULL,
  "creator" UUID NOT NULL,
  "created_at" timestamptz NOT NULL DEFAULT (now())
);

CREATE TABLE "business_logs" (
  "business_log_id" BIGSERIAL PRIMARY KEY,
  "event" varchar(50) NOT NULL,
  "device" varchar(50) NOT NULL,
  "os" varchar(50) NOT NULL,
  "ip" varchar(50) NOT NULL,
  "agent" varchar(50) NOT NULL,
  "position_id" bigint,
  "company_id" bigint,
  "role_id" bigint NOT NULL,
  "team_id" bigint,
  "app_id" bigint NOT NULL,
  "creator" UUID,
  "created_at" timestamptz NOT NULL DEFAULT (now())
);

-- -----------------

ALTER TABLE "apps" ADD FOREIGN KEY ("industry_id") REFERENCES "industries" ("industry_id");

ALTER TABLE "teams" ADD FOREIGN KEY ("industry_id") REFERENCES "industries" ("industry_id");

ALTER TABLE "companies" ADD FOREIGN KEY ("industry_id") REFERENCES "industries" ("industry_id");

ALTER TABLE "companies" ADD FOREIGN KEY ("bank_account_all_id") REFERENCES "bank_account_all" ("bank_account_all_id");

ALTER TABLE "teams_apps_companies" ADD FOREIGN KEY ("team_id") REFERENCES "teams" ("team_id");

ALTER TABLE "teams_apps_companies" ADD FOREIGN KEY ("app_id") REFERENCES "apps" ("app_id");

ALTER TABLE "teams_apps_companies" ADD FOREIGN KEY ("company_id") REFERENCES "companies" ("company_id");

ALTER TABLE "users" ADD FOREIGN KEY ("status_id") REFERENCES "statuses" ("status_id");

ALTER TABLE "users" ADD FOREIGN KEY ("cred_id") REFERENCES "creds" ("cred_id");

ALTER TABLE "users" ADD FOREIGN KEY ("bank_account_all_id") REFERENCES "bank_account_all" ("bank_account_all_id");

ALTER TABLE "users" ADD FOREIGN KEY ("user_info_id") REFERENCES "users_info" ("user_info_id");

ALTER TABLE "bank_account_all" ADD FOREIGN KEY ("account_1") REFERENCES "bank_account" ("bank_account_id");

ALTER TABLE "bank_account_all" ADD FOREIGN KEY ("account_2") REFERENCES "bank_account" ("bank_account_id");

ALTER TABLE "bank_account_all" ADD FOREIGN KEY ("account_3") REFERENCES "bank_account" ("bank_account_id");

ALTER TABLE "bank_account_all" ADD FOREIGN KEY ("account_4") REFERENCES "bank_account" ("bank_account_id");

ALTER TABLE "bank_account_all" ADD FOREIGN KEY ("account_5") REFERENCES "bank_account" ("bank_account_id");

ALTER TABLE "users_roles_apps_companies" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("user_id");

ALTER TABLE "users_roles_apps_companies" ADD FOREIGN KEY ("role_id") REFERENCES "roles" ("role_id");

ALTER TABLE "users_roles_apps_companies" ADD FOREIGN KEY ("app_id") REFERENCES "apps" ("app_id");

ALTER TABLE "users_roles_apps_companies" ADD FOREIGN KEY ("company_id") REFERENCES "companies" ("company_id");

ALTER TABLE "users_roles_apps_positions_teams_companies" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("user_id");

ALTER TABLE "users_roles_apps_positions_teams_companies" ADD FOREIGN KEY ("role_id") REFERENCES "roles" ("role_id");

ALTER TABLE "users_roles_apps_positions_teams_companies" ADD FOREIGN KEY ("app_id") REFERENCES "apps" ("app_id");

ALTER TABLE "users_roles_apps_positions_teams_companies" ADD FOREIGN KEY ("position_id") REFERENCES "positions" ("position_id");

ALTER TABLE "users_roles_apps_positions_teams_companies" ADD FOREIGN KEY ("team_id") REFERENCES "teams" ("team_id");

ALTER TABLE "users_roles_apps_positions_teams_companies" ADD FOREIGN KEY ("company_id") REFERENCES "companies" ("company_id");

ALTER TABLE "user_logs" ADD FOREIGN KEY ("position_id") REFERENCES "positions" ("position_id");

ALTER TABLE "user_logs" ADD FOREIGN KEY ("company_id") REFERENCES "companies" ("company_id");

ALTER TABLE "user_logs" ADD FOREIGN KEY ("role_id") REFERENCES "roles" ("role_id");

ALTER TABLE "user_logs" ADD FOREIGN KEY ("team_id") REFERENCES "teams" ("team_id");

ALTER TABLE "user_logs" ADD FOREIGN KEY ("app_id") REFERENCES "apps" ("app_id");

ALTER TABLE "user_logs" ADD FOREIGN KEY ("creator") REFERENCES "users" ("user_id");

ALTER TABLE "business_logs" ADD FOREIGN KEY ("position_id") REFERENCES "positions" ("position_id");

ALTER TABLE "business_logs" ADD FOREIGN KEY ("company_id") REFERENCES "companies" ("company_id");

ALTER TABLE "business_logs" ADD FOREIGN KEY ("role_id") REFERENCES "roles" ("role_id");

ALTER TABLE "business_logs" ADD FOREIGN KEY ("team_id") REFERENCES "teams" ("team_id");

ALTER TABLE "business_logs" ADD FOREIGN KEY ("app_id") REFERENCES "apps" ("app_id");

ALTER TABLE "business_logs" ADD FOREIGN KEY ("creator") REFERENCES "users" ("user_id");

CREATE INDEX ON "apps" ("app");

CREATE INDEX ON "teams" ("team_id");

CREATE INDEX ON "teams" ("team", "industry_id");

CREATE INDEX ON "companies" ("company");

CREATE INDEX ON "users" ("email");

CREATE INDEX ON "users" ("username");

CREATE INDEX ON "bank_account" ("account_number");

CREATE INDEX ON "bank_account" ("isbn");

CREATE INDEX ON "user_logs" ("event");

CREATE INDEX ON "business_logs" ("event");

COMMENT ON COLUMN "industries"."rv" IS 'use for handle hybrid concurrncy';

COMMENT ON COLUMN "statuses"."rv" IS 'use for handle hybrid concurrncy';

COMMENT ON COLUMN "roles"."rv" IS 'use for handle hybrid concurrncy';

COMMENT ON COLUMN "positions"."rv" IS 'use for handle hybrid concurrncy';

COMMENT ON COLUMN "apps"."rv" IS 'use for handle hybrid concurrncy';

COMMENT ON COLUMN "teams"."rv" IS 'use for handle hybrid concurrncy';

COMMENT ON COLUMN "companies"."region" IS 'which continental?';

COMMENT ON COLUMN "companies"."rv" IS 'use for handle hybrid concurrncy';

COMMENT ON COLUMN "teams_apps_companies"."rv" IS 'use for handle hybrid concurrncy';

COMMENT ON COLUMN "creds"."rv" IS 'use for handle hybrid concurrncy';

COMMENT ON COLUMN "users_info"."rv" IS 'use for handle hybrid concurrncy';

COMMENT ON COLUMN "users"."cred_id" IS 'one to one, cred contain deleted ones';

COMMENT ON COLUMN "users"."bank_account_all_id" IS 'one to many, user is parent';

COMMENT ON COLUMN "users"."user_info_id" IS 'one to one';

COMMENT ON COLUMN "users"."rv" IS 'use for handle hybrid concurrncy';

COMMENT ON COLUMN "bank_account"."rv" IS 'use for handle hybrid concurrncy';

COMMENT ON COLUMN "bank_account_all"."rv" IS 'use for handle hybrid concurrncy';

COMMENT ON COLUMN "users_roles_apps_companies"."rv" IS 'use for handle hybrid concurrncy';

COMMENT ON COLUMN "users_roles_apps_positions_teams_companies"."rv" IS 'use for handle hybrid concurrncy';

COMMENT ON COLUMN "business_logs"."position_id" IS 'maybe is it a guest';

COMMENT ON COLUMN "business_logs"."company_id" IS 'maybe is it a guest';

COMMENT ON COLUMN "business_logs"."role_id" IS 'maybe is it a guest';

COMMENT ON COLUMN "business_logs"."team_id" IS 'maybe is it a guest';

COMMENT ON COLUMN "business_logs"."app_id" IS 'maybe is it a guest';

COMMENT ON COLUMN "business_logs"."creator" IS 'maybe is it a guest';