# ActiveRecord Quick Reference (Cheat Sheet)


## Migrations

### Data Types

**Numerics**

Type         | Options
------------ | ------- 
integer      | limit - number of bytes e.g. bigint w/ 8 bytes, tinyint w/ 1 byte, etc.
float        |
decimal      | precision - total number of significant digits, scale - number of digits following the decimal point  e.g. The number 123.45 has a precision of 5 and a scale of 2; a decimal with a precision of 5 and a scale of 2 can range from -999.99 to 999.99.


decimal Notes:
- The SQL standard says the default scale should be 0, scale <= precision,
  and makes no comments about the requirements of precision.
- SQLite3    - No restrictions on precision and scale, but the maximum supported precision is 16. No default.
- MySQL      - ??
- PostgreSQL - precision [1..infinity], scale [0..infinity]. No default.


Column Types Mappings

Type      | MySQL      | PostgreSQL    | SQLite        | Ruby Class
--------- | ---------- | ------------- | ------------- | ---------- 
integer   |            | integer       | integer       | Numeric
float     |            | float         | float         | Float 
decimal   |            | decimal       | decimal       | BigDecimal




**Strings**

Type         | Options
------------ | -------
string       | limit - number of characters
text         | limit - number of characters

Column Types Mappings

Type      | MySQL      | PostgreSQL        | SQLite        | Ruby Class
--------- | ---------- | ----------------- | ------------- | ---------- 
string    |            | character varying | varchar(255)  |
text      |            | text              | text          |



**Date**

Type         | Options
------------ | -------
date         |
datetime     |
time         |


Column Types Mappings

Type      | MySQL      | PostgreSQL    | SQLite        | Ruby Class
--------- | ---------- | ------------- | ------------- | ---------- 
date      |            | date          | date          |
datetime  |            | timestamp     | datetime      |
time      |            | time          | time          |


**The Works**

Type         | Options                
------------ | -----------------------
binary       | limit - number of bytes
boolean      |

boolean Notes:
- SQLite - ActiveRecord stores t and f in column (do NOT expect numeric 0 or 1)


Column Types Mappings

Type        | MySQL      | PostgreSQL    | SQLite        | Ruby Class
----------- | ---------- | ------------- | ------------- | ---------- 
binary      |            | bytea         | blob          |
boolean     |            | boolean       | boolean       |


**Primary Keys**

ActiveRecord auto-adds primary_key `id` by default;
allows only single columns (NOT composite keys);
primary key colum by definition is NOT NULL;
numeric (integer/sequence) recommended

Column Types Mappings

Type        | MySQL      | PostgreSQL    | SQLite        | Ruby Class
----------- | ---------- | ------------- | ------------- | ---------- 
primary_key |            | serial primary key | integer primary key autoincrement not null | 



#### General Column Type Options

Option      | Comments
------------| --------------------
null        | true or false - Allows or disallows NULL values in the column. This option could have been named :null_allowed.
default     | The column's default value. Use nil for NULL.
index       | Create an index for the column. Can be either true or an options hash.
required    | true or false - required: true is an alias for null: false


- first: true    ??
- after: :email  ??
- unique: true   ??  -- used for add index only??



#### Short-Hand Types

Type         | Comments
------------ | -------------
timestamps   | adds created_at and updated_at as datetimes.
references   | adds an appropriately-named _id column (e.g. brewery becomes brewery_id)


**references Options**

Option       | Comments
------------ | ----------
polymorphic  | If the polymorphic option is used a corresponding _type column gets added; if the polymorphic is a hash of options, these will be passed through when creating the _type column.
index        | If the index option is used it will also create an index, similar to calling add_index.

Examples:

~~~
t.references :tag,  index: { name: 'index_taggings_on_tag_id' }

  =>

t.integer :tag_id
add_index :taggings, :tag_id, name: 'index_taggings_on_tag_id'
~~~

~~~
t.references :tagger,  polymorphic: true, index: true

  =>

t.integer :tagger_id
t.string  :tagger_type
add_index :taggings, [:tagger_id, :tagger_type]
~~~

~~~
t.references :taggable,  polymorphic: { default: 'Photo' }

  =>

t.integer :taggable_id
t.string  :taggable_type, default: 'Photo'
~~~


### "Reserved" Magic ActiveRecord Column Names

Name           | Comments
-------------- | ----------------------
type           | used for single table inheritance (STI)
<column>_cache | used for counter caches
<column>_type  | used for polymorphic associations
??? add more   |


### Migration Methods

**create_table**

~~~
create_table :table_name, {table_options} do |t|
  t.string :name, {column_options}
end
~~~~

table_options:

Option          | Comments
--------------- | -----------------------------------------------
force           | true or false - if true, forces drop of an existing table of the same name before creation the new one
temporary       | true or false - if true, creates a temporary table, one that goes away when the application disconnects from the database
id              | true or false - if false, defines a table with no primary key, for example when you need to define a join table
primary_key     | symbol - overrides the default name of :id for the primary column. Use this to specify the name of the column in the database that Rails will use to store the primary key
options         | string - pass raw options to your underlying database, e.g. auto_in- crement = 10000. Note that passing options will cause you to lose the default ENGINE=InnoDB statement


**create_join_table (Short-Hand)**

~~~
create_join_table :table_name_one, :table_name_two
~~~


**add_foreign_key**

??


**add_index**

~~~
add_index :table_name, :column_name, :unique => true
~~~


## References

For mappings see the NATIVE_DATABASE_TYPES hash in the ActiveRecord connection adapter:
- [sqlite3_adapter.rb](https://github.com/rails/rails/blob/master/activerecord/lib/active_record/connection_adapters/sqlite3_adapter.rb)
- [mysql_adapter.rb](https://github.com/rails/rails/blob/master/activerecord/lib/active_record/connection_adapters/mysql_adapter.rb)
- [postgresql_adpater.rb](https://github.com/rails/rails/blob/master/activerecord/lib/active_record/connection_adapters/postgresql_adapter.rb)

