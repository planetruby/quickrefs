# ActiveRecord Quick Reference (Cheat Sheet)

## Migrations

Data Types

Type         | Options | Comments
------------ | ------- | -------------
primary_key  |
string       | limit
text         | limit
integer      | limit
float        |
decimal      | precision, scale 
datetime     |
time         |
date         |
binary       | limit
boolean      |

General Options

- null
- default
- required: true  alias for null: false
- index


PostgreSQL Data Types

- hstore
- json
- array
- cidr_address
- ip_address
- mac_address

Short-Hand Types

- timestamps  -  adds created_at and updated_at as datetimes.


PostgreSQL Types




Colum Types Mappings

Type      | PostgreSQL | SQLite
--------- | ---------- | -------------
binary    | bytea      | blob
boolean   | boolean    | boolean
date      | date       | date
datetime  | timestamp  | datetime
decimal   | decimal    | decimal
float     | float      | float
integer   | integer    | integer
string    | *          | varchar(255)
text      | text       | text
time      | time       | datetime
timestamp | timestamp  | datetime


### Options

- null       - Allows or disallows NULL values in the column. This option could have been named :null_allowed.
- default    - The column's default value. Use nil for NULL.
- limit      - Requests a maximum column length. This is number of characters for :string and :text columns and number of bytes for :binary and :integer columns.
- precision  - Specifies the precision for a :decimal column.
- scale      - Specifies the scale for a :decimal column.
- index      - Create an index for the column. Can be either true or an options hash.

Note: None of the options are set by default.

default: <value>
limit: 30
null: false
first: true      ## ??
after: :email    ## ??
unique: true     ## ??


Note: The precision is the total number of significant digits 
and the scale is the number of digits that can be stored following the decimal point. For example:

-  The number 123.45 has a precision of 5 and a scale of 2.
-  A decimal with a precision of 5 and a scale of 2 can range from -999.99 to 999.99.

Please be aware of different behavior with :decimal columns for :database systems: 

The SQL standard says the default scale should be 0, :scale <= :precision, and makes no comments about the requirements of :precision.

- PostgreSQL: :precision [1..infinity], :scale [0..infinity]. No default.
- SQLite3: No restrictions on :precision and :scale, but the maximum supported :precision is 16. No default.




### references (Short-Hands Type)

- :references  -  add an appropriately-named _id colum (e.g. brewery becomes brewery_id)

**references Options**

- If the :polymorphic option is used a corresponding _type column gets added; if the :polymorphic is a hash of options, these will be passed through when creating the _type column.
- If the :index option is used it will also create an index, similar to calling add_index.

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


### Migration Methods

~~~
create_table
change_table
drop_table

add_column
change_column
rename_column
remove_column

add_index
remove_index
~~~

**Table Methods**

change_table

~~~
change_table :table_name, {options} do |t|
  t.change :column_name, :new_column_type
  t.remove :column_name
end
~~~

create_table

~~~
create_table :table_name, {table_options} do |t|
  t.string :name, {column_options}
end
~~~~

table_options:

- :force       true or false if true, forces drop of an existing table of the same name before creation the new one
- :temporary   true or false if true, creates a temporary table, one that goes away when the application disconnects from the database
- :id          true or false if false, defines a table with no primary key, for example when you need to define a join table
- :primary_key :symbol overrides the default name of :id for the primary column. Use this to specify the name of the column in the database
  that Rails will use to store the primary key
- :options     "string" pass raw options to your underlying database, e.g. auto_in- crement = 10000. Note that passing options will cause you to lose the default ENGINE=InnoDB statement

drop_table

~~~
drop_table :table_name
~~~

rename_table

~~~
rename_table :old_table_name, :new_table_name
~~~


## column methods

add_column

~~~
add_column :table_name, :column_name, :column_type, {column_options}
~~~

column_options:
- :null true or false if false, the underlying column has a not null constraint added by the database engine
- :limit integer set a limit on the size of the field
- :default string set a default value for the column
- :precision integer Specifies the precision for a :decimal column.
- :scale integer Specifies the scale for a :decimal column.

change_column

~~~
change_column :table_name, :column_name, :new_column_type
~~~

rename_column

~~~
rename_column :table_name, :old_column_name, :new_column_name
~~~

remove_column

~~~
remove_column :table_name, :column_name
~~~


## index methods

add_index

~~~
add_index :table_name, :column_name, :unique => true
~~~

remove_index

~~~
remove_index :table_name, :column_name
~~~

