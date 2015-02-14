# ActiveRecord Quick Reference (Cheat Sheet)

## MySQL / MariaDB

## Connection Settings

Option    | Comments
--------  | ---------------
host      | Defaults to "localhost".
port      | Defaults to 3306.
socket    | Defaults to "/tmp/mysql.sock".
username  | Defaults to "root"
password  | Defaults to nothing.
database  | The name of the database. No default, must be provided.
encoding  | (Optional) Sets the client encoding by executing "SET NAMES <encoding>" after connection.
reconnect | Defaults to false (See MySQL documentation: http://dev.mysql.com/doc/refman/5.0/en/auto-reconnect.html).
strict    | Defaults to true. Enable STRICT_ALL_TABLES. (See MySQL documentation: http://dev.mysql.com/doc/refman/5.0/en/server-sql-mode.html)
variables | (Optional) A hash session variables to send as SET @@SESSION.key = value on each database connection. Use the value +:default+ to set a variable to its DEFAULT value. (See MySQL documentation: http://dev.mysql.com/doc/refman/5.0/en/set-statement.html).
sslca     | Necessary to use MySQL with an SSL connection.
sslkey    | Necessary to use MySQL with an SSL connection.
sslcert   | Necessary to use MySQL with an SSL connection.
sslcapath | Necessary to use MySQL with an SSL connection.
sslcipher | Necessary to use MySQL with an SSL connection.


### Types

- bigint (8 bytes)   - use integer limit:8
- tinyint (1 byte)   - use integer limit:1


### Mappings

~~~

~~~

