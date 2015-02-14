
CREATE TABLE "users" (
  "id"                INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  "name"              varchar,
  "full_name"         varchar,
  "email"             varchar,
  "password_digest"   varchar,
  "created_at"        datetime,
  "updated_at"        datetime);

CREATE TABLE "bookmarks" (
  "id"                INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  "user_id"           integer,
  "url"               varchar,
  "url_digest"        varchar,
  "short_description" varchar,
  "long_description"  text,
  "public"            boolean,
  "created_at"        datetime,
  "updated_at"        datetime);

CREATE TABLE "user_bookmarks" (
  "id"                INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  "user_id"           integer,
  "bookmark_id"       integer);

CREATE TABLE "tags" (
  "id"                INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  "name"              varchar);

CREATE TABLE "taggings" (
  "id"                INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  "tag_id"            integer,
  "taggable_id"       integer,
  "taggable_type"     varchar);


CREATE INDEX "index_bookmarks_on_url_digest" ON "bookmarks" ("url_digest");
CREATE INDEX "index_taggings_on_tag_id_and_taggable_id_and_taggable_type" ON "taggings" ("tag_id", "taggable_id", "taggable_type");
CREATE INDEX "index_tags_on_name" ON "tags" ("name");
CREATE INDEX "index_users_on_name" ON "users" ("name");
