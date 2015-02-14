## stdlibs
require 'logger'
require 'pp'

## 3rd party gems
require 'active_record'

class CreateDb < ActiveRecord::Migration
  
  def self.from_file( path )
    self.new( File.read( path ) )
  end
  
  def initialize( code )
    @code = code
  end

  def up
    eval( @code )
    ## todo: use class_eval or something?? less generic
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end


## add logger
ActiveRecord::Base.logger = Logger.new( STDOUT )

dbs= [
  'bookmark',
  'music',
  'slideshow',
  ]

dbs.each do |db|

  db_config = {
    adapter: 'sqlite3',
    database: "./#{db}.db"
  }

  pp db_config
  ActiveRecord::Base.establish_connection( db_config )

  CreateDb.from_file( "./schema/#{db}.rb" ).up
end

## use
##  sqlite3 bookmark.db .schema    # to dump sql schema

