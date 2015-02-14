# ActiveRecord Quick Reference (Cheat Sheet)

## SQLite

### Connection

Option     | Comments
---------- | ---------------------
database   | use :memory: for in-memory database; note: every (re)connect starts a new/empty database
timeout    |


### Mappings

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

### Music Example

~~~

~~~

