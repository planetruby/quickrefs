# ActiveRecord Quick Reference (Cheat Sheet)

Live Walkthrough - try (run) the working code - basics.rb


###  Require

~~~
require 'activerecord'
~~~

###  Connect to SQLite In-Memory Database

~~~
ActiveRecord::Base.establish_connection( adapter: 'sqlite3', database: ':inmemory' )
~~~

### Turn on Logging

~~~
ActiveRecord::Logger = Logger.new( STDOUT) 
~~~

## Create Schema (Tables)

...

