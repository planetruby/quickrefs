# ActiveRecord Quick Reference (Cheat Sheet)

## SQLite

### Connection

Option     | Comments
---------- | ---------------------
database   | use :memory: for in-memory database; note: every (re)connect starts a new/empty database 
timeout    |


### Types


**Mappings**

~~~
NATIVE_DATABASE_TYPES = {
        primary_key:  'integer primary key autoincrement not null',
        string:       { name: "varchar" },
        text:         { name: "text" },
        integer:      { name: "integer" },
        float:        { name: "float" },
        decimal:      { name: "decimal" },
        datetime:     { name: "datetime" },
        time:         { name: "time" },
        date:         { name: "date" },
        binary:       { name: "blob" },
        boolean:      { name: "boolean" }
      }
~~~

(Source: [sqlite3_adapter.rb](https://github.com/rails/rails/blob/master/activerecord/lib/active_record/connection_adapters/sqlite3_adapter.rb))

**Notes**

decimal Notes:
- No restrictions on precision and scale, but the maximum supported precision is 16. No default.

boolean Notes:
- ActiveRecord stores t and f in column (do NOT expect numeric 0 or 1).




### Music Example

-- fix: include schema/music.rb  (do NOT duplicate)

~~~
  create_table :artists do |t|
    t.string      :name,    null: false, limit: 100
    t.timestamps
  end

  create_table :albums do |t|
    t.string      :title,   null: false
    t.references  :artist,  null: false
    t.integer     :year
    t.timestamps
  end

  create_table :songs do |t|
    t.string      :title,   null: false
    t.references  :album,   null: false
    t.decimal     :length,              precision: 6, scale: 2   # e.g. 9999.99 to -9999.99
    t.timestamps
    end
~~~

becomes

-- fix: include schema/music.sqlite.rb  (do NOT duplicate)

~~~
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
~~~


### References

add here

