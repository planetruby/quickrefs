# ActiveRecord Quick Reference (Cheat Sheet)

## Migration 

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

change_table

~~~
change_table :table_name, {options} do |t|
  t.change :column_name, :new_column_type
  t.remove :column_name
end
~~~

create_table

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


drop_table

~~~
drop_table :table_name
~~~

rename_table

~~~
rename_table :old_table_name, :new_table_name
~~~


## column methods

add_column

~~~
add_column :table_name, :column_name, :column_type, {column_options}
~~~

column_options:

Option    | Commments
--------- | ----------------
null      | true or false  -  if false, the underlying column has a not null constraint added by the database engine
limit     | integer        -  set a limit on the size of the field
default   | string         -  set a default value for the column
precision | integer        - Specifies the precision for a :decimal column.
scale     | integer        - Specifies the scale for a :decimal column.

change_column

~~~
change_column :table_name, :column_name, :new_column_type
~~~

rename_column

~~~
rename_column :table_name, :old_column_name, :new_column_name
~~~

remove_column

~~~
remove_column :table_name, :column_name
~~~


## index methods

add_index

~~~
add_index :table_name, :column_name, :unique => true
~~~

remove_index

~~~
remove_index :table_name, :column_name
~~~


