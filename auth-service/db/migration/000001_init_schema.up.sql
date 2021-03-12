CREATE TABLE "users" (
  "id" SERIAL PRIMARY KEY,
  "email" varchar(40) UNIQUE NOT NULL,
  "username" varchar(30) UNIQUE NOT NULL,
  "user_info_id" bigint NOT NULL REFERENCES users_info(id) on delete cascade,
  "cred_id" bigint REFERENCES creds(id) on delete set null,
  "role_id" bigint REFERENCES roles(id) on delete set null DEFAULT 1,
  "team_id" bigint REFERENCES teams(id) on delete set null DEFAULT 1,
  "account_id" bigint REFERENCES accounts(id) on delete set null,
  "deleted" boolean DEFAULT false,
  "created_at" timestamptz NOT NULL DEFAULT (now()),
  "updated_at" timestamptz,
  "deleted_at" timestamptz,
  "rv" integer DEFAULT 0
);

CREATE TABLE "users_info" (
  "id" SERIAL PRIMARY KEY,
  "user_id" bigint NOT NULL REFERENCES users(id) on delete cascade,
  "first_name" varchar(50),
  "last_name" varchar(50),
  "dob" datetime NOT NULL,
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
  "rv" integer DEFAULT 0
);

CREATE TABLE "creds" (
  "id" SERIAL PRIMARY KEY,
  "user_id" bigint NOT NULL REFERENCES users(id) on delete cascade,
  "hashed_pass" varchar(200) NOT NULL,
  "deleted" boolean DEFAULT false,
  "created_at" timestamptz NOT NULL DEFAULT (now()),
  "updated_at" timestamptz,
  "deleted_at" timestamptz
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
  "ceo" bigint REFERENCES users(id) on delete set null,
  "manager" bigint REFERENCES users(id) on delete set null,
  "hr" bigint REFERENCES users(id) on delete set null,
  "tech_guy" bigint  REFERENCES users(id) on delete set null,
  "indsutry" varchar(50) NOT NULL,
  "deleted" boolean DEFAULT false,
  "created_at" timestamptz NOT NULL DEFAULT (now()),
  "updated_at" timestamptz,
  "deleted_at" timestamptz,
  "rv" integer DEFAULT 0
);

CREATE TABLE "accounts" (
  "id" SERIAL PRIMARY KEY,
  "user_id" bigint REFERENCES on delete cascade,
  "bank_name" varchar(100) NOT NULL,
  "account_number" varchar(100) UNIQUE NOT NULL,
  "deleted" boolean DEFAULT false,
  "created_at" timestamptz NOT NULL DEFAULT (now()),
  "updated_at" timestamptz,
  "deleted_at" timestamptz,
  "rv" integer DEFAULT 0
);

CREATE INDEX ON "users" ("id");

CREATE INDEX ON "users" ("email");

CREATE INDEX ON "users" ("username");

CREATE INDEX ON "users_info" ("id");

CREATE INDEX ON "users_info" ("cell_phone", "first_name", "last_name");

CREATE INDEX ON "roles" ("id");

CREATE INDEX ON "roles" ("role_name");

CREATE INDEX ON "teams" ("id");

CREATE INDEX ON "teams" ("team_name", "indsutry");

CREATE INDEX ON "accounts" ("id");

CREATE INDEX ON "accounts" ("account_number");

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
