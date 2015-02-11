# ActiveRecord Quick Reference (Cheat Sheet)

## Migrations

Data Types

- :primary_key
- :string
- :text
- :integer
- :float
- :decimal
- :datetime
- :time
- :date
- :binary
- :boolean

Special Types (Short-Hands):

- :timestamps  -  adds created_at and updated_at as datetimes.
- :references  -  add an appropriately-named _id colum (e.g. brewery becomes brewery_id)

**references Options**

- If the :polymorphic option is used a corresponding _type column gets added; if the :polymorphic is a hash of options, these will be passed through when creating the _type column.
- If the :index option is used it will also create an index, similar to calling add_index.

~~~
create_table :taggings do |t|
  t.references :tag,       index: { name: 'index_taggings_on_tag_id' }
  t.references :tagger,    polymorphic: true, index: true
  t.references :taggable,  polymorphic: { default: 'Photo' }
end
~~~

becomes

~~~
create_table :taggings do |t|
  t.integer :tag_id
  t.integer :tagger_id
  t.string  :tagger_type
  t.integer :taggable_id
  t.string  :taggable_type, default: 'Photo'
end
add_index :taggings, :tag_id, name: 'index_taggings_on_tag_id'
add_index :taggings, [:tagger_id, :tagger_type]
~~~

### Options

- :limit      - Requests a maximum column length. This is number of characters for :string and :text columns and number of bytes for :binary and :integer columns.
- :default    - The column's default value. Use nil for NULL.
- :null       - Allows or disallows NULL values in the column. This option could have been named :null_allowed.
- :precision  - Specifies the precision for a :decimal column.
- :scale      - Specifies the scale for a :decimal column.
- :index      - Create an index for the column. Can be either true or an options hash.

Note: None of the options are set by default.

Note: The precision is the total number of significant digits 
and the scale is the number of digits that can be stored following the decimal point. For example:

-  The number 123.45 has a precision of 5 and a scale of 2.
-  A decimal with a precision of 5 and a scale of 2 can range from -999.99 to 999.99.

Please be aware of different behavior with :decimal columns for :database systems: 

The SQL standard says the default scale should be 0, :scale <= :precision, and makes no comments about the requirements of :precision.

- PostgreSQL: :precision [1..infinity], :scale [0..infinity]. No default.
- SQLite3: No restrictions on :precision and :scale, but the maximum supported :precision is 16. No default.


### References

- [Rails Guide - Migrations]()
- [Rails API - Table Class ??]()



