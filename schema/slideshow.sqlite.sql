
CREATE TABLE "photo" (
  "id"           INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  "filename"     varchar);

CREATE TABLE "slideshows" (
  "id"           INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  "title"        varchar,
  "created_at"   datetime,
  "updated_at"   datetime);

CREATE TABLE "slides" (
  "id"           INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  "position"     integer,
  "slideshow_id" integer,
  "photo_id"     integer);

CREATE TABLE "categories" (
  "id"           INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  "name"         varchar,
  "parent_id"    integer);

CREATE TABLE "categories_photos" (
  "id"           INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  "category_id"  integer,
  "photo_id"     integer);

