
CREATE TABLE "artists" (
  "id"         INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  "name"       varchar(100) NOT NULL,
  "created_at" datetime,
  "updated_at" datetime) 

CREATE TABLE "albums" (
  "id"         INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  "title"      varchar NOT NULL,
  "artist_id"  integer NOT NULL,
  "year"       integer,
  "created_at" datetime,
  "updated_at" datetime) 

CREATE TABLE "songs" (
  "id"         INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  "title"      varchar NOT NULL,
  "album_id"   integer NOT NULL,
  "length"     decimal(6,2),
  "created_at" datetime,
  "updated_at" datetime) 

