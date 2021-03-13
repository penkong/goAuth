-- ALTER TABLE
--   "users"
-- ADD
--   CONSTRAINT "user_info_id_fk_to_users" FOREIGN KEY ("user_info_id") REFERENCES "users_info" ("id") ON DELETE
-- SET
--   NULL;

-- ALTER TABLE
--   "users"
-- ADD
--   CONSTRAINT "cred_id_fk_to_users" FOREIGN KEY ("cred_id") REFERENCES "creds" ("id") ON DELETE
-- SET
--   NULL;

-- ;

-- ALTER TABLE
--   "users"
-- ADD
--   CONSTRAINT "role_id_fk_to_users" FOREIGN KEY ("role_id") REFERENCES "roles" ("id") ON DELETE
-- SET
--   NULL;

-- ALTER TABLE
--   "users"
-- ADD
--   CONSTRAINT "team_id_fk_to_users" FOREIGN KEY ("team_id") REFERENCES "teams" ("id") ON DELETE
-- SET
--   NULL;

-- ALTER TABLE
--   "users"
-- ADD
--   CONSTRAINT "account_id_fk_to_users" FOREIGN KEY ("account_id") REFERENCES "accounts" ("id") ON DELETE
-- SET
--   NULL;

-- ALTER TABLE
--   "teams"
-- ADD
--   CONSTRAINT "ceo_id_fk_to_users" FOREIGN KEY ("ceo_id") REFERENCES "users" ("id") ON DELETE
-- SET
--   NULL;

-- ALTER TABLE
--   "teams"
-- ADD
--   CONSTRAINT "manager_id_fk_to_users" FOREIGN KEY ("manager") REFERENCES "users" ("id") ON DELETE
-- SET
--   NULL;

-- ALTER TABLE
--   "teams"
-- ADD
--   CONSTRAINT "hr_id_fk_to_users" FOREIGN KEY ("hr") REFERENCES "users" ("id") ON DELETE
-- SET
--   NULL;

-- ALTER TABLE
--   "teams"
-- ADD
--   CONSTRAINT "tech_guy_id_fk_to_users" FOREIGN KEY ("tech_guy") REFERENCES "users" ("id") ON DELETE
-- SET
--   NULL;



SET statement_timeout = "10s";


CREATE TABLE "users" (
  "id" SERIAL PRIMARY KEY,
  "email" varchar(40) UNIQUE NOT NULL,
  "username" varchar(30) UNIQUE NOT NULL,
  "user_info_id" bigint UNIQUE NOT NULL,
  "cred_id" bigint UNIQUE NOT NULL,
  "role_id" bigint DEFAULT 1,
  "team_id" bigint DEFAULT 1,
  "account_id" bigint,
  "apps_id" bigint NOT NULL,
  "company_id" bigint,
  "deleted" boolean DEFAULT false,
  "created_at" timestamptz NOT NULL DEFAULT (now()),
  "updated_at" timestamptz,
  "deleted_at" timestamptz,
  "rv" integer DEFAULT 0,
  UNIQUE(email, username)
);

CREATE TABLE "users_info" (
  "id" SERIAL PRIMARY KEY,
  "first_name" varchar(50),
  "last_name" varchar(50),
  "dob" date NOT NULL,
  "company_id" bigint,
  "org_position" varchar(50),
  "team_id" bigint,
  "cell_phone" varchar(24) UNIQUE,
  "home_phone" varchar(24),
  "work_phone" varchar(24),
  "avatar" varchar(200),
  "work_address" varchar(200),
  "home_address" varchar(200),
  "current_city" varchar(75),
  "current_country" varchar(75),
  "zip_code" varchar(75),
  "national_number" varchar(30) UNIQUE,
  "national_card_pic" varchar(200) UNIQUE,
  "passport_number_type" varchar(50) UNIQUE,
  "passport_pic" varchar(200) UNIQUE,
  "deleted" boolean DEFAULT false,
  "created_at" timestamptz NOT NULL DEFAULT (now()),
  "updated_at" timestamptz,
  "deleted_at" timestamptz,
  "rv" integer DEFAULT 0,
  CHECK(COALESCE(cell_phone, home_phone, work_phone) IS NOT NULL),
  UNIQUE(national_number, passport_number_type),
  UNIQUE(passport_number_type, current_country)
);

CREATE TABLE "creds" (
  "id" SERIAL PRIMARY KEY,
  "hashed_pass" varchar(200) NOT NULL UNIQUE,
  "deleted" boolean DEFAULT false,
  "created_at" timestamptz NOT NULL DEFAULT (now()),
  "updated_at" timestamptz,
  "deleted_at" timestamptz,
  "rv" integer DEFAULT 0
);

CREATE TABLE "roles" (
  "id" SERIAL PRIMARY KEY,
  "role_name" varchar(30) UNIQUE NOT NULL,
  "deleted" boolean DEFAULT false,
  "created_at" timestamptz NOT NULL DEFAULT (now()),
  "updated_at" timestamptz,
  "deleted_at" timestamptz,
  "rv" integer DEFAULT 0
);

CREATE TABLE "teams" (
  "id" SERIAL PRIMARY KEY,
  "team_name" varchar(100) UNIQUE NOT NULL,
  "account_id" bigint,
  "leader" bigint,
  "observer" bigint,
  "hr" bigint,
  "tech_guy" bigint,
  "industry_id" bigint NOT NULL,
  "deleted" boolean DEFAULT false,
  "created_at" timestamptz NOT NULL DEFAULT (now()),
  "updated_at" timestamptz,
  "deleted_at" timestamptz,
  "rv" integer DEFAULT 0,
  UNIQUE(team_name, industry_id),
  CHECK(COALESCE(leader, observer, hr, tech_guy) IS NOT NULL)
);

CREATE TABLE "accounts" (
  "id" SERIAL PRIMARY KEY,
  "bank_name" varchar(100) NOT NULL,
  "account_number" varchar(100) NOT NULL,
  "account_type" varchar(50) NOT NULL,
  "isbn" varchar(100) UNIQUE,
  "deleted" boolean DEFAULT false,
  "created_at" timestamptz NOT NULL DEFAULT (now()),
  "updated_at" timestamptz,
  "deleted_at" timestamptz,
  "rv" integer DEFAULT 0
);

CREATE TABLE "accounts_all" (
  "id" SERIAL PRIMARY KEY,
  "account_main" bigint,
  "account_2" bigint,
  "account_3" bigint,
  "account_4" bigint,
  "account_5" bigint,
  "deleted" boolean DEFAULT false,
  "created_at" timestamptz NOT NULL DEFAULT (now()),
  "updated_at" timestamptz,
  "deleted_at" timestamptz,
  "rv" integer DEFAULT 0,
  CHECK(COALESCE(account_main, account_2, account_3, account_4, account_5) IS NOT NULL)
);

CREATE TABLE "apps" (
  "id" SERIAL PRIMARY KEY,
  "app_name" varchar(100) UNIQUE NOT NULL,
  "industry_id" bigint,
  "company_id" bigint,
  "team_id" bigint,
  "web" boolean,
  "ios" boolean,
  "android" boolean,
  "desktop" boolean,
  "paid" boolean DEFAULT false,
  "deleted" boolean DEFAULT false,
  "created_at" timestamptz NOT NULL DEFAULT (now()),
  "updated_at" timestamptz,
  "deleted_at" timestamptz,
  "rv" integer DEFAULT 0,
  UNIQUE(app_name, industry_id),
  CHECK(COALESCE(company_id, team_id, industry_id) IS NOT NULL),
  CHECK(COALESCE(web, ios, android, desktop) IS NOT NULL)
);

CREATE TABLE "industries" (
  "id" SERIAL PRIMARY KEY,
  "industry_name" varchar(100) UNIQUE NOT NULL,
  "how_clean" varchar(50) NOT NULL,
  "deleted" boolean DEFAULT false,
  "created_at" timestamptz NOT NULL DEFAULT (now()),
  "updated_at" timestamptz,
  "deleted_at" timestamptz,
  "rv" integer DEFAULT 0
);

CREATE TABLE "companies" (
  "id" SERIAL PRIMARY KEY,
  "company_name" varchar(100) NOT NULL,
  "industry_id" bigint,
  "app_id" bigint,
  "team_id" bigint,
  "account_id" bigint,
  "ceo" bigint,
  "manager" bigint,
  "hr" bigint,
  "cto" bigint,
  "country" varchar(50),
  "region" varchar(50),
  "address" varchar(400),
  "how_clean" varchar(50) NOT NULL,
  "deleted" boolean DEFAULT false,
  "created_at" timestamptz NOT NULL DEFAULT (now()),
  "updated_at" timestamptz,
  "deleted_at" timestamptz,
  "rv" integer DEFAULT 0,
  CHECK(COALESCE(team_id, app_id, industry_id) IS NOT NULL),
  CHECK(COALESCE(ceo, manager, hr,cto) IS NOT NULL),
  UNIQUE(ceo, region, country, address)
);

ALTER TABLE "users" ADD FOREIGN KEY ("user_info_id") REFERENCES "users_info" ("id");

ALTER TABLE "users" ADD FOREIGN KEY ("cred_id") REFERENCES "creds" ("id");

ALTER TABLE "users" ADD FOREIGN KEY ("role_id") REFERENCES "roles" ("id");

ALTER TABLE "users" ADD FOREIGN KEY ("team_id") REFERENCES "teams" ("id");

ALTER TABLE "users" ADD FOREIGN KEY ("account_id") REFERENCES "accounts_all" ("id");

ALTER TABLE "users" ADD FOREIGN KEY ("apps_id") REFERENCES "apps" ("id");

ALTER TABLE "users" ADD FOREIGN KEY ("company_id") REFERENCES "companies" ("id");

ALTER TABLE "users_info" ADD FOREIGN KEY ("company_id") REFERENCES "companies" ("id");

ALTER TABLE "users_info" ADD FOREIGN KEY ("team_id") REFERENCES "teams" ("id");

ALTER TABLE "teams" ADD FOREIGN KEY ("account_id") REFERENCES "accounts_all" ("id");

ALTER TABLE "teams" ADD FOREIGN KEY ("leader") REFERENCES "users" ("id");

ALTER TABLE "teams" ADD FOREIGN KEY ("observer") REFERENCES "users" ("id");

ALTER TABLE "teams" ADD FOREIGN KEY ("hr") REFERENCES "users" ("id");

ALTER TABLE "teams" ADD FOREIGN KEY ("tech_guy") REFERENCES "users" ("id");

ALTER TABLE "teams" ADD FOREIGN KEY ("industry_id") REFERENCES "industries" ("id");

ALTER TABLE "accounts_all" ADD FOREIGN KEY ("account_main") REFERENCES "accounts" ("id");

ALTER TABLE "accounts_all" ADD FOREIGN KEY ("account_2") REFERENCES "accounts" ("id");

ALTER TABLE "accounts_all" ADD FOREIGN KEY ("account_3") REFERENCES "accounts" ("id");

ALTER TABLE "accounts_all" ADD FOREIGN KEY ("account_4") REFERENCES "accounts" ("id");

ALTER TABLE "accounts_all" ADD FOREIGN KEY ("account_5") REFERENCES "accounts" ("id");

ALTER TABLE "apps" ADD FOREIGN KEY ("industry_id") REFERENCES "industries" ("id");

ALTER TABLE "apps" ADD FOREIGN KEY ("company_id") REFERENCES "companies" ("id");

ALTER TABLE "apps" ADD FOREIGN KEY ("team_id") REFERENCES "teams" ("id");

ALTER TABLE "companies" ADD FOREIGN KEY ("industry_id") REFERENCES "industries" ("id");

ALTER TABLE "companies" ADD FOREIGN KEY ("app_id") REFERENCES "apps" ("id");

ALTER TABLE "companies" ADD FOREIGN KEY ("team_id") REFERENCES "teams" ("id");

ALTER TABLE "companies" ADD FOREIGN KEY ("account_id") REFERENCES "accounts_all" ("id");

ALTER TABLE "companies" ADD FOREIGN KEY ("ceo") REFERENCES "users" ("id");

ALTER TABLE "companies" ADD FOREIGN KEY ("manager") REFERENCES "users" ("id");

ALTER TABLE "companies" ADD FOREIGN KEY ("hr") REFERENCES "users" ("id");

ALTER TABLE "companies" ADD FOREIGN KEY ("cto") REFERENCES "users" ("id");

CREATE INDEX ON "users" ("id");

CREATE INDEX ON "users" ("email");

CREATE INDEX ON "users" ("username");

CREATE INDEX ON "users_info" ("id");

CREATE INDEX ON "users_info" ("cell_phone", "first_name", "last_name");

CREATE INDEX ON "creds" ("id");

CREATE INDEX ON "roles" ("id");

CREATE INDEX ON "roles" ("role_name");

CREATE INDEX ON "teams" ("id");

CREATE INDEX ON "teams" ("team_name", "industry_id");

CREATE INDEX ON "accounts" ("id");

CREATE INDEX ON "accounts" ("account_number");

CREATE INDEX ON "accounts_all" ("id");

CREATE INDEX ON "accounts_all" ("account_main");

CREATE INDEX ON "apps" ("id");

CREATE INDEX ON "apps" ("app_name");

CREATE INDEX ON "industries" ("id");

CREATE INDEX ON "industries" ("industry_name");

CREATE INDEX ON "companies" ("id");

CREATE INDEX ON "companies" ("company_name");

COMMENT ON COLUMN "users"."user_info_id" IS 'one to one';

COMMENT ON COLUMN "users"."cred_id" IS 'one to one, cred contain deleted ones';

COMMENT ON COLUMN "users"."role_id" IS 'many to one, role is parent';

COMMENT ON COLUMN "users"."team_id" IS 'many to one, team is parent';

COMMENT ON COLUMN "users"."account_id" IS 'one to many, user is parent';

COMMENT ON COLUMN "users"."rv" IS 'use for handle hybrid concurrncy';

COMMENT ON COLUMN "users_info"."rv" IS 'use for handle hybrid concurrncy';

COMMENT ON COLUMN "roles"."rv" IS 'use for handle hybrid concurrncy';

COMMENT ON COLUMN "teams"."rv" IS 'use for handle hybrid concurrncy';

COMMENT ON COLUMN "accounts"."rv" IS 'use for handle hybrid concurrncy';

COMMENT ON COLUMN "accounts_all"."rv" IS 'use for handle hybrid concurrncy';

COMMENT ON COLUMN "apps"."rv" IS 'use for handle hybrid concurrncy';

COMMENT ON COLUMN "industries"."rv" IS 'use for handle hybrid concurrncy';

COMMENT ON COLUMN "companies"."region" IS 'which? asia , euro, america ...';

COMMENT ON COLUMN "companies"."rv" IS 'use for handle hybrid concurrncy';