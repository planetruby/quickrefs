# ActiveRecord Quick Reference (Cheat Sheet)

## Migrations

Data Types

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

Special Types

- :primary_key
- :references
- :timestamps

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


