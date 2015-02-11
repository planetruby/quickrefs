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


