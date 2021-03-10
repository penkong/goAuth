CREATE TYPE eventfor AS ENUM (
  'login',
  'logout',
  'signup',
  'updated',
  'deleted',
  'created',
  'read',
  'started',
  'success',
  'error',
  'finished'
);

CREATE TABLE "users_info" (
  "id" SERIAL PRIMARY KEY,
  "created_at" timestamptz NOT NULL DEFAULT (now()),
  "updated_at" timestamptz,
  "deleted_at" timestamptz,
  "deleted" boolean DEFAULT false,
  "rv" integer DEFAULT 0,
  "group_id" bigint,
  "right_id" bigint,
  "user_id" bigint UNIQUE NOT NULL,
  "first_name" varchar(50),
  "last_name" varchar(50),
  "cell_phone" varchar(24) UNIQUE,
  "home_phone" varchar(24),
  "work_phone" varchar(24),
  "avatar" varchar(200),
  "work_address" varchar(200),
  "home_address" varchar(200),
  "current_city" varchar(75),
  "current_country" varchar(75),
  "zip_code" varchar(75),
  "national_number" varchar(30),
  "national_card_pic" varchar(200) UNIQUE,
  "passport_number_type" varchar(50) UNIQUE,
  "passport_pic" varchar(200) UNIQUE,
  "team_id" bigint
);

CREATE TABLE "users_info_logs" (
  "id" SERIAL PRIMARY KEY,
  "created_at" timestamptz NOT NULL DEFAULT (now()),
  "rv" integer DEFAULT 0,
  "by_who" bigint NOT NULL,
  "event_type" eventfor NOT NULL,
  "user_id" bigint NOT NULL
);

CREATE TABLE "teams" (
  "id" SERIAL PRIMARY KEY,
  "created_at" timestamptz NOT NULL DEFAULT (now()),
  "updated_at" timestamptz,
  "deleted_at" timestamptz,
  "deleted" boolean DEFAULT false,
  "rv" integer DEFAULT 0,
  "team_name" varchar(100) UNIQUE NOT NULL,
  "created_by" bigint NOT NULL,
  "manager" bigint NOT NULL,
  "hr" bigint NOT NULL,
  "tech_guy" bigint NOT NULL,
  "indsutry" varchar(50) NOT NULL
);

CREATE TABLE "team_logs" (
  "id" SERIAL PRIMARY KEY,
  "created_at" timestamptz NOT NULL DEFAULT (now()),
  "rv" integer DEFAULT 0,
  "by_who" bigint NOT NULL,
  "event_type" eventfor NOT NULL,
  "team_id" bigint NOT NULL
);

CREATE TABLE "users_login" (
  "id" SERIAL PRIMARY KEY,
  "created_at" timestamptz NOT NULL DEFAULT (now()),
  "updated_at" timestamptz,
  "deleted_at" timestamptz,
  "deleted" boolean DEFAULT false,
  "rv" integer DEFAULT 0,
  "email" varchar(40) UNIQUE NOT NULL,
  "username" varchar(30) UNIQUE NOT NULL,
  "hashed_pass" varchar(200) NOT NULL,
  "role_id" bigint NOT NULL
);

CREATE TABLE "users_login_logs" (
  "id" SERIAL PRIMARY KEY,
  "created_at" timestamptz NOT NULL DEFAULT (now()),
  "rv" integer DEFAULT 0,
  "by_who" bigint NOT NULL,
  "event_type" eventfor NOT NULL,
  "user_id" bigint NOT NULL,
  "user_ip" varchar(30) NOT NULL,
  "device_type" varchar(30) NOT NULL,
  "os_type" varchar(30) NOT NULL,
  "lat" REAL,
  "lng" REAL
);

CREATE TABLE "user_change_password_logs" (
  "id" SERIAL PRIMARY KEY,
  "created_at" timestamptz NOT NULL DEFAULT (now()),
  "rv" integer DEFAULT 0,
  "by_who" bigint NOT NULL,
  "event_type" eventfor NOT NULL,
  "user_id" bigint NOT NULL,
  "hashed_old_pass" varchar(200) NOT NULL
);

CREATE TABLE "roles" (
  "id" SERIAL PRIMARY KEY,
  "created_at" timestamptz NOT NULL DEFAULT (now()),
  "updated_at" timestamptz,
  "deleted_at" timestamptz,
  "deleted" boolean DEFAULT false,
  "rv" integer DEFAULT 0,
  "created_by" bigint NOT NULL,
  "role_name" varchar(30) UNIQUE NOT NULL
);

CREATE TABLE "role_logs" (
  "id" SERIAL PRIMARY KEY,
  "created_at" timestamptz NOT NULL DEFAULT (now()),
  "rv" integer DEFAULT 0,
  "by_who" bigint NOT NULL,
  "event_type" eventfor NOT NULL,
  "role_id" bigint NOT NULL
);

CREATE TABLE "groups" (
  "id" SERIAL PRIMARY KEY,
  "created_at" timestamptz NOT NULL DEFAULT (now()),
  "updated_at" timestamptz,
  "deleted_at" timestamptz,
  "deleted" boolean DEFAULT false,
  "rv" integer DEFAULT 0,
  "created_by" bigint NOT NULL,
  "group_name" varchar(50) UNIQUE NOT NULL
);

CREATE TABLE "group_logs" (
  "id" SERIAL PRIMARY KEY,
  "created_at" timestamptz NOT NULL DEFAULT (now()),
  "rv" integer DEFAULT 0,
  "by_who" bigint NOT NULL,
  "event_type" eventfor NOT NULL,
  "group_id" bigint NOT NULL
);

CREATE TABLE "rights" (
  "id" SERIAL PRIMARY KEY,
  "created_at" timestamptz NOT NULL DEFAULT (now()),
  "updated_at" timestamptz,
  "deleted_at" timestamptz,
  "deleted" boolean DEFAULT false,
  "rv" integer DEFAULT 0,
  "by_who" bigint NOT NULL,
  "right_name" varchar(50) UNIQUE NOT NULL
);

CREATE TABLE "right_logs" (
  "id" SERIAL PRIMARY KEY,
  "created_at" timestamptz NOT NULL DEFAULT (now()),
  "rv" integer DEFAULT 0,
  "by_who" bigint NOT NULL,
  "event_type" eventfor NOT NULL,
  "right_id" bigint NOT NULL
);

CREATE TABLE "users_groups" (
  "id" SERIAL PRIMARY KEY,
  "created_at" timestamptz NOT NULL DEFAULT (now()),
  "updated_at" timestamptz,
  "deleted_at" timestamptz,
  "deleted" boolean DEFAULT false,
  "rv" integer DEFAULT 0,
  "user_id" bigint NOT NULL,
  "group_id" bigint NOT NULL
);

CREATE TABLE "users_groups_logs" (
  "id" SERIAL PRIMARY KEY,
  "created_at" timestamptz NOT NULL DEFAULT (now()),
  "rv" integer DEFAULT 0,
  "by_who" bigint NOT NULL,
  "event_type" eventfor NOT NULL,
  "user_group_id" bigint NOT NULL
);

CREATE TABLE "groups_rights" (
  "id" SERIAL PRIMARY KEY,
  "created_at" timestamptz NOT NULL DEFAULT (now()),
  "updated_at" timestamptz,
  "deleted_at" timestamptz,
  "deleted" boolean DEFAULT false,
  "rv" integer DEFAULT 0,
  "created_by" bigint NOT NULL,
  "group_id" bigint NOT NULL,
  "right_id" bigint NOT NULL
);

CREATE TABLE "group_right_logs" (
  "id" SERIAL PRIMARY KEY,
  "created_at" timestamptz NOT NULL DEFAULT (now()),
  "rv" integer DEFAULT 0,
  "by_who" bigint NOT NULL,
  "event_type" eventfor NOT NULL,
  "group_right_id" bigint NOT NULL
);

CREATE TABLE "users_groups_rights" (
  "id" SERIAL PRIMARY KEY,
  "created_at" timestamptz NOT NULL DEFAULT (now()),
  "updated_at" timestamptz,
  "deleted_at" timestamptz,
  "deleted" boolean DEFAULT false,
  "rv" integer DEFAULT 0,
  "created_by" bigint NOT NULL,
  "user_id" bigint NOT NULL,
  "group_id" bigint NOT NULL,
  "right_id" bigint NOT NULL
);

CREATE TABLE "users_groups_rights_logs" (
  "id" SERIAL PRIMARY KEY,
  "created_at" timestamptz NOT NULL DEFAULT (now()),
  "rv" integer DEFAULT 0,
  "by_who" bigint NOT NULL,
  "event_type" eventfor NOT NULL,
  "ugr_id" bigint NOT NULL
);

ALTER TABLE "users_info" ADD FOREIGN KEY ("group_id") REFERENCES "groups" ("id");

ALTER TABLE "users_info" ADD FOREIGN KEY ("right_id") REFERENCES "rights" ("id");

ALTER TABLE "users_info" ADD FOREIGN KEY ("user_id") REFERENCES "users_login" ("id");

ALTER TABLE "users_info" ADD FOREIGN KEY ("team_id") REFERENCES "teams" ("id");

ALTER TABLE "users_info_logs" ADD FOREIGN KEY ("by_who") REFERENCES "users_login" ("id");

ALTER TABLE "users_info_logs" ADD FOREIGN KEY ("user_id") REFERENCES "users_login" ("id");

ALTER TABLE "teams" ADD FOREIGN KEY ("created_by") REFERENCES "users_login" ("id");

ALTER TABLE "teams" ADD FOREIGN KEY ("manager") REFERENCES "users_login" ("id");

ALTER TABLE "teams" ADD FOREIGN KEY ("hr") REFERENCES "users_login" ("id");

ALTER TABLE "teams" ADD FOREIGN KEY ("tech_guy") REFERENCES "users_login" ("id");

ALTER TABLE "team_logs" ADD FOREIGN KEY ("by_who") REFERENCES "users_login" ("id");

ALTER TABLE "team_logs" ADD FOREIGN KEY ("team_id") REFERENCES "teams" ("id");

ALTER TABLE "users_login" ADD FOREIGN KEY ("role_id") REFERENCES "roles" ("id");

ALTER TABLE "users_login_logs" ADD FOREIGN KEY ("by_who") REFERENCES "users_login" ("id");

ALTER TABLE "users_login_logs" ADD FOREIGN KEY ("user_id") REFERENCES "users_login" ("id");

ALTER TABLE "user_change_password_logs" ADD FOREIGN KEY ("by_who") REFERENCES "users_login" ("id");

ALTER TABLE "user_change_password_logs" ADD FOREIGN KEY ("user_id") REFERENCES "users_login" ("id");

ALTER TABLE "roles" ADD FOREIGN KEY ("created_by") REFERENCES "users_login" ("id");

ALTER TABLE "role_logs" ADD FOREIGN KEY ("by_who") REFERENCES "users_login" ("id");

ALTER TABLE "role_logs" ADD FOREIGN KEY ("role_id") REFERENCES "roles" ("id");

ALTER TABLE "groups" ADD FOREIGN KEY ("created_by") REFERENCES "users_login" ("id");

ALTER TABLE "group_logs" ADD FOREIGN KEY ("by_who") REFERENCES "users_login" ("id");

ALTER TABLE "group_logs" ADD FOREIGN KEY ("group_id") REFERENCES "groups" ("id");

ALTER TABLE "rights" ADD FOREIGN KEY ("by_who") REFERENCES "users_login" ("id");

ALTER TABLE "right_logs" ADD FOREIGN KEY ("by_who") REFERENCES "users_login" ("id");

ALTER TABLE "right_logs" ADD FOREIGN KEY ("right_id") REFERENCES "rights" ("id");

ALTER TABLE "users_groups" ADD FOREIGN KEY ("user_id") REFERENCES "users_login" ("id");

ALTER TABLE "users_groups" ADD FOREIGN KEY ("group_id") REFERENCES "groups" ("id");

ALTER TABLE "users_groups_logs" ADD FOREIGN KEY ("by_who") REFERENCES "users_login" ("id");

ALTER TABLE "users_groups_logs" ADD FOREIGN KEY ("user_group_id") REFERENCES "users_groups" ("id");

ALTER TABLE "groups_rights" ADD FOREIGN KEY ("created_by") REFERENCES "users_login" ("id");

ALTER TABLE "groups_rights" ADD FOREIGN KEY ("group_id") REFERENCES "groups" ("id");

ALTER TABLE "groups_rights" ADD FOREIGN KEY ("right_id") REFERENCES "rights" ("id");

ALTER TABLE "group_right_logs" ADD FOREIGN KEY ("by_who") REFERENCES "users_login" ("id");

ALTER TABLE "group_right_logs" ADD FOREIGN KEY ("group_right_id") REFERENCES "groups_rights" ("id");

ALTER TABLE "users_groups_rights" ADD FOREIGN KEY ("created_by") REFERENCES "users_login" ("id");

ALTER TABLE "users_groups_rights" ADD FOREIGN KEY ("user_id") REFERENCES "users_login" ("id");

ALTER TABLE "users_groups_rights" ADD FOREIGN KEY ("group_id") REFERENCES "groups" ("id");

ALTER TABLE "users_groups_rights" ADD FOREIGN KEY ("right_id") REFERENCES "rights" ("id");

ALTER TABLE "users_groups_rights_logs" ADD FOREIGN KEY ("by_who") REFERENCES "users_login" ("id");

ALTER TABLE "users_groups_rights_logs" ADD FOREIGN KEY ("ugr_id") REFERENCES "users_groups_rights" ("id");

CREATE INDEX ON "users_info" ("id");

CREATE INDEX ON "users_info" ("cell_phone", "first_name", "last_name");

CREATE INDEX ON "teams" ("id");

CREATE INDEX ON "teams" ("team_name", "indsutry");

CREATE INDEX ON "users_login" ("id");

CREATE INDEX ON "users_login" ("email");

CREATE INDEX ON "users_login" ("username");

CREATE INDEX ON "roles" ("id");

CREATE INDEX ON "roles" ("role_name");

CREATE INDEX ON "groups" ("id");

CREATE INDEX ON "groups" ("group_name");

CREATE INDEX ON "rights" ("id");

CREATE INDEX ON "rights" ("right_name");

CREATE INDEX ON "users_groups" ("id");

CREATE INDEX ON "users_groups" ("user_id", "group_id");

CREATE INDEX ON "groups_rights" ("id");

CREATE INDEX ON "groups_rights" ("group_id", "right_id");

CREATE INDEX ON "users_groups_rights" ("id");

CREATE INDEX ON "users_groups_rights" ("user_id", "group_id", "right_id");

COMMENT ON COLUMN "users_info"."rv" IS 'use for handle hybrid concurrncy';

COMMENT ON COLUMN "users_info_logs"."rv" IS 'use for handle hybrid concurrncy';

COMMENT ON COLUMN "teams"."rv" IS 'use for handle hybrid concurrncy';

COMMENT ON COLUMN "team_logs"."rv" IS 'use for handle hybrid concurrncy';

COMMENT ON COLUMN "users_login"."rv" IS 'use for handle hybrid concurrncy';

COMMENT ON COLUMN "users_login_logs"."rv" IS 'use for handle hybrid concurrncy';

COMMENT ON COLUMN "user_change_password_logs"."rv" IS 'use for handle hybrid concurrncy';

COMMENT ON COLUMN "roles"."rv" IS 'use for handle hybrid concurrncy';

COMMENT ON COLUMN "role_logs"."rv" IS 'use for handle hybrid concurrncy';

COMMENT ON COLUMN "groups"."rv" IS 'use for handle hybrid concurrncy';

COMMENT ON COLUMN "group_logs"."rv" IS 'use for handle hybrid concurrncy';

COMMENT ON COLUMN "rights"."rv" IS 'use for handle hybrid concurrncy';

COMMENT ON COLUMN "right_logs"."rv" IS 'use for handle hybrid concurrncy';

COMMENT ON COLUMN "users_groups"."rv" IS 'use for handle hybrid concurrncy';

COMMENT ON COLUMN "users_groups_logs"."rv" IS 'use for handle hybrid concurrncy';

COMMENT ON COLUMN "groups_rights"."rv" IS 'use for handle hybrid concurrncy';

COMMENT ON COLUMN "group_right_logs"."rv" IS 'use for handle hybrid concurrncy';

COMMENT ON COLUMN "users_groups_rights"."rv" IS 'use for handle hybrid concurrncy';

COMMENT ON COLUMN "users_groups_rights_logs"."rv" IS 'use for handle hybrid concurrncy';
