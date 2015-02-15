
## stdlibs
require 'logger'
require 'pp'

## 3rd party gems
require 'active_record'


DB_CONFIG = {
  adapter: 'sqlite3',
  database: ':memory:'
}

pp DB_CONFIG
ActiveRecord::Base.establish_connection( DB_CONFIG )

## add logger
ActiveRecord::Base.logger = Logger.new( STDOUT )


## create schema / some tables
c = ActiveRecord::Base.connection

c.create_table :artists do |t|
    t.string      :name,    null: false, limit: 100
    t.timestamps
  end

c.create_table :albums do |t|
    t.string      :title,   null: false
    t.references  :artist,  null: false
    t.integer     :year
    t.timestamps
  end

c.create_table :songs do |t|
    t.string      :title,   null: false
    t.references  :album,   null: false
    t.decimal     :length,              precision: 6, scale: 2   # e.g. 9999.99 to -9999.99
    t.timestamps
    end



class Artist < ActiveRecord::Base
  has_many :albums
  has_many :songs, :through => :albums
end

class Album  < ActiveRecord::Base
  belongs_to :artist
  has_many   :songs
end

class Song   < ActiveRecord::Base
  belongs_to :album
end


###
# try reflections on models
#
#  see api.rubyonrails.org/classes/ActiveRecord/Reflection/ClassMethods.html
#      api.rubyonrails.org/classes/ActiveRecord/Reflection/MacroReflection.html
#
#  github.com/rails/rails/blob/master/activerecord/lib/active_record/reflection.rb

puts "Artist Reflections:"
puts "==================="
pp Artist.reflections

puts "Album Reflections:"
puts "==================="
pp Album.reflections

puts "Song Reflections:"
puts "==================="
pp Song.reflections

puts ""
puts ""

assocs = Artist.reflections.values
pp assocs

puts ""
puts ":has_many"

assocs = assocs.select { |ref| ref.macro == :has_many }
pp assocs

puts ""
puts ":has_many"

assocs.each do |assoc|
  puts "#{assoc.macro} #{assoc.name}"
  puts "options:"
  pp assoc.options
end
