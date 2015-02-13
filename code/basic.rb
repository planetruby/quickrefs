# activerecord code walkthrough
#

## stdlibs
require 'logger'

## 3rd party gems
require 'activerecord'

ActiveRecord::Base.establish_connection( adapter: 'sqlite3', database: ':memory:')

## add logger

## create schema / some tables

