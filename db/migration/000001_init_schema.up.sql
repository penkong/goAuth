create extension if not exists "uuid-ossp";

-- UNIQUE(email, username)
-- -- CHECK(COALESCE(cell_phone, home_phone, work_phone) IS NOT NULL),
-- UNIQUE(first_name, last_name, dob),
-- UNIQUE(national_number, passport_number_type),
-- UNIQUE(passport_number_type, current_country)

-- UNIQUE(team_name, industry_id),
-- CHECK(
--   COALESCE(leader, observer, hr, tech_guy) IS NOT NULL
-- )
-- CHECK(
--   COALESCE(
--     account_main,
--     account_2,
--     account_3,
--     account_4,
--     account_5
--   ) IS NOT NULL
-- )
-- UNIQUE(app_name, industry_id),
-- CHECK(
--   COALESCE(company_id, team_id, industry_id) IS NOT NULL
-- ),
-- CHECK(COALESCE(web, ios, android, desktop) IS NOT NULL)


-- CHECK(
--   COALESCE(team_id, app_id, industry_id) IS NOT NULL
-- ),
-- UNIQUE(ceo, region, country, address)
  -- "user_info_id" uuid DEFAULT uuid_generate_v4() PRIMARY KEY,

SET
  statement_timeout = "10s";

CREATE TABLE "users" (
  "user_id" uuid DEFAULT uuid_generate_v4() PRIMARY KEY,
  "email" varchar(40) UNIQUE NOT NULL,
  "username" varchar(30) UNIQUE NOT NULL,
  "cred_id" UUID UNIQUE NOT NULL,
  "account_id" UUID,
  "user_info_id" UUID UNIQUE NOT NULL,
  "role_id" bigint DEFAULT 1,
  "team_id" bigint DEFAULT 1,
  "position_id" bigint,
  "apps_id" bigint NOT NULL,
  "company_id" bigint,
  "created_at" timestamptz NOT NULL DEFAULT (now()),
  "updated_at" timestamptz,
  "deleted_at" timestamptz,
  "deleted" boolean DEFAULT false,
  "rv" integer NOT NULL DEFAULT 0
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
  "work_address" varchar(200),
  "home_address" varchar(200),
  "current_city" varchar(75),
  "current_country" varchar(75),
  "zip_code" varchar(75),
  "national_number" varchar(30) UNIQUE,
  "national_card_pic" varchar(200) UNIQUE,
  "passport_number_type" varchar(50) UNIQUE,
  "passport_pic" varchar(200) UNIQUE,
  "created_at" timestamptz NOT NULL DEFAULT (now()),
  "updated_at" timestamptz,
  "deleted_at" timestamptz,
  "deleted" boolean DEFAULT false,
  "rv" integer NOT NULL DEFAULT 0
);

CREATE TABLE "user_logs" (
  "user_logs_id" BIGSERIAL PRIMARY KEY,
  "event" varchar(50) NOT NULL,
  "device" varchar(50) NOT NULL,
  "os" varchar(50) NOT NULL,
  "ip" varchar(50) NOT NULL,
  "agent" varchar(50) NOT NULL,
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
  "app_id" bigint NOT NULL,
  "creator" UUID,
  "created_at" timestamptz NOT NULL DEFAULT (now())
);

CREATE TABLE "creds" (
  "cred_id" uuid DEFAULT uuid_generate_v4() PRIMARY KEY,
  "hashed_pass" varchar(200) NOT NULL,
  "created_at" timestamptz NOT NULL DEFAULT (now()),
  "updated_at" timestamptz,
  "deleted_at" timestamptz,
  "deleted" boolean DEFAULT false,
  "rv" integer NOT NULL DEFAULT 0
);

CREATE TABLE "roles" (
  "role_id" BIGSERIAL PRIMARY KEY,
  "role" varchar(30) UNIQUE NOT NULL,
  "created_at" timestamptz NOT NULL DEFAULT (now()),
  "updated_at" timestamptz,
  "deleted_at" timestamptz,
  "deleted" boolean DEFAULT false,
  "rv" integer NOT NULL DEFAULT 0
);

CREATE TABLE "positions" (
  "position_id" BIGSERIAL PRIMARY KEY,
  "position" varchar(50) UNIQUE NOT NULL,
  "created_at" timestamptz NOT NULL DEFAULT (now()),
  "updated_at" timestamptz,
  "deleted_at" timestamptz,
  "deleted" boolean DEFAULT false,
  "rv" integer NOT NULL DEFAULT 0
);

CREATE TABLE "teams" (
  "team_id" BIGSERIAL PRIMARY KEY,
  "team" varchar(100) NOT NULL,
  "company_id" bigint,
  "industry_id" bigint,
  "app_id" bigint,
  "created_at" timestamptz NOT NULL DEFAULT (now()),
  "updated_at" timestamptz,
  "deleted_at" timestamptz,
  "deleted" boolean DEFAULT false,
  "rv" integer NOT NULL DEFAULT 0
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
  "rv" integer NOT NULL DEFAULT 0
);

CREATE TABLE "bank_account_all" (
  "bank_account_all_id" uuid DEFAULT uuid_generate_v4() PRIMARY KEY,
  "account_1" bigint,
  "account_2" bigint,
  "account_3" bigint,
  "account_4" bigint,
  "account_5" bigint,
  "created_at" timestamptz NOT NULL DEFAULT (now()),
  "updated_at" timestamptz,
  "deleted_at" timestamptz,
  "deleted" boolean DEFAULT false,
  "rv" integer DEFAULT 0
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
  "paid" boolean DEFAULT false,
  "team_id" bigint,
  "industry_id" bigint,
  "company_id" bigint,
  "created_at" timestamptz NOT NULL DEFAULT (now()),
  "updated_at" timestamptz,
  "deleted_at" timestamptz,
  "deleted" boolean DEFAULT false,
  "rv" integer DEFAULT 0
);

CREATE TABLE "industries" (
  "industry_id" BIGSERIAL PRIMARY KEY,
  "industry" varchar(100) UNIQUE NOT NULL,
  "how_clean" int NOT NULL,
  "created_at" timestamptz NOT NULL DEFAULT (now()),
  "updated_at" timestamptz,
  "deleted_at" timestamptz,
  "deleted" boolean DEFAULT false,
  "rv" integer DEFAULT 0
);

CREATE TABLE "companies" (
  "company_id" SERIAL PRIMARY KEY,
  "company" varchar(100) NOT NULL,
  "country" varchar(50) NOT NULL,
  "region" varchar(50) NOT NULL,
  "address" varchar(400) NOT NULL,
  "how_clean" int NOT NULL,
  "industry_id" bigint,
  "account_id" UUID,
  "ceo" bigint,
  "manager" bigint,
  "hr" bigint,
  "created_at" timestamptz NOT NULL DEFAULT (now()),
  "updated_at" timestamptz,
  "deleted_at" timestamptz,
  "deleted" boolean DEFAULT false,
  "rv" integer DEFAULT 0
);

ALTER TABLE "users" ADD FOREIGN KEY ("cred_id") REFERENCES "creds" ("cred_id");

ALTER TABLE "users" ADD FOREIGN KEY ("account_id") REFERENCES "bank_account_all" ("bank_account_all_id");

ALTER TABLE "users" ADD FOREIGN KEY ("user_info_id") REFERENCES "users_info" ("user_info_id");

ALTER TABLE "users" ADD FOREIGN KEY ("role_id") REFERENCES "roles" ("role_id");

ALTER TABLE "users" ADD FOREIGN KEY ("team_id") REFERENCES "teams" ("team_id");

ALTER TABLE "users" ADD FOREIGN KEY ("position_id") REFERENCES "positions" ("position_id");

ALTER TABLE "users" ADD FOREIGN KEY ("apps_id") REFERENCES "apps" ("app_id");

ALTER TABLE "users" ADD FOREIGN KEY ("company_id") REFERENCES "companies" ("company_id");

ALTER TABLE "user_logs" ADD FOREIGN KEY ("app_id") REFERENCES "apps" ("app_id");

ALTER TABLE "user_logs" ADD FOREIGN KEY ("creator") REFERENCES "users" ("user_id");

ALTER TABLE "business_logs" ADD FOREIGN KEY ("app_id") REFERENCES "apps" ("app_id");

ALTER TABLE "business_logs" ADD FOREIGN KEY ("creator") REFERENCES "users" ("user_id");

ALTER TABLE "teams" ADD FOREIGN KEY ("company_id") REFERENCES "companies" ("company_id");

ALTER TABLE "teams" ADD FOREIGN KEY ("industry_id") REFERENCES "industries" ("industry_id");

ALTER TABLE "teams" ADD FOREIGN KEY ("app_id") REFERENCES "apps" ("app_id");

ALTER TABLE "bank_account_all" ADD FOREIGN KEY ("account_1") REFERENCES "bank_account" ("bank_account_id");

ALTER TABLE "bank_account_all" ADD FOREIGN KEY ("account_2") REFERENCES "bank_account" ("bank_account_id");

ALTER TABLE "bank_account_all" ADD FOREIGN KEY ("account_3") REFERENCES "bank_account" ("bank_account_id");

ALTER TABLE "bank_account_all" ADD FOREIGN KEY ("account_4") REFERENCES "bank_account" ("bank_account_id");

ALTER TABLE "bank_account_all" ADD FOREIGN KEY ("account_5") REFERENCES "bank_account" ("bank_account_id");

ALTER TABLE "apps" ADD FOREIGN KEY ("team_id") REFERENCES "teams" ("team_id");

ALTER TABLE "apps" ADD FOREIGN KEY ("industry_id") REFERENCES "industries" ("industry_id");

ALTER TABLE "apps" ADD FOREIGN KEY ("company_id") REFERENCES "companies" ("company_id");

ALTER TABLE "companies" ADD FOREIGN KEY ("industry_id") REFERENCES "industries" ("industry_id");

ALTER TABLE "companies" ADD FOREIGN KEY ("account_id") REFERENCES "bank_account_all" ("bank_account_all_id");

ALTER TABLE "companies" ADD FOREIGN KEY ("ceo") REFERENCES "users" ("user_id");

ALTER TABLE "companies" ADD FOREIGN KEY ("manager") REFERENCES "users" ("user_id");

ALTER TABLE "companies" ADD FOREIGN KEY ("hr") REFERENCES "users" ("user_id");

CREATE INDEX ON "users" ("email");

CREATE INDEX ON "users" ("username");

CREATE INDEX ON "users_info" ("first_name", "last_name");

CREATE INDEX ON "user_logs" ("event");

CREATE INDEX ON "business_logs" ("event");

CREATE INDEX ON "roles" ("role");

CREATE INDEX ON "positions" ("position");

CREATE INDEX ON "teams" ("team_id");

CREATE INDEX ON "teams" ("team", "company_id", "industry_id");

CREATE INDEX ON "bank_account" ("account_number");

CREATE INDEX ON "bank_account" ("isbn");

CREATE INDEX ON "apps" ("app");

CREATE INDEX ON "industries" ("industry");

CREATE INDEX ON "companies" ("company");

COMMENT ON COLUMN "users"."cred_id" IS 'one to one, cred contain deleted ones';

COMMENT ON COLUMN "users"."account_id" IS 'one to many, user is parent';

COMMENT ON COLUMN "users"."user_info_id" IS 'one to one';

COMMENT ON COLUMN "users"."role_id" IS 'many to one, role is parent';

COMMENT ON COLUMN "users"."team_id" IS 'many to one, team is parent';

COMMENT ON COLUMN "users"."rv" IS 'use for handle hybrid concurrncy';

COMMENT ON COLUMN "users_info"."rv" IS 'use for handle hybrid concurrncy';

COMMENT ON COLUMN "business_logs"."creator" IS 'maybe is it a guest';

COMMENT ON COLUMN "creds"."rv" IS 'use for handle hybrid concurrncy';

COMMENT ON COLUMN "roles"."rv" IS 'use for handle hybrid concurrncy';

COMMENT ON COLUMN "positions"."rv" IS 'use for handle hybrid concurrncy';

COMMENT ON COLUMN "teams"."rv" IS 'use for handle hybrid concurrncy';

COMMENT ON COLUMN "bank_account"."rv" IS 'use for handle hybrid concurrncy';

COMMENT ON COLUMN "bank_account_all"."rv" IS 'use for handle hybrid concurrncy';

COMMENT ON COLUMN "apps"."rv" IS 'use for handle hybrid concurrncy';

COMMENT ON COLUMN "industries"."rv" IS 'use for handle hybrid concurrncy';

COMMENT ON COLUMN "companies"."region" IS 'which continental?';

COMMENT ON COLUMN "companies"."rv" IS 'use for handle hybrid concurrncy';
