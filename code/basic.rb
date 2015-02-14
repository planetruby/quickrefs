#######################################
# activerecord code walkthrough
#
#  run like
#    $ ruby ./code/basic.rb


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
# data, see en.wikipedia.org/wiki/List_of_grunge_albums

nirvana     = Artist.create!( name: 'Nirvana' )
soundgarden = Artist.create!( name: 'Soundgarden' )

bleach   = Album.create!( artist: nirvana, title: 'Bleach',    year: 1989 )
nevermind= Album.create!( artist: nirvana, title: 'Nevermind', year: 1991 )
## or bleach.create_album!( )

Song.create!( album: bleach, title: 'Blew',             length: 2.55 )
Song.create!( album: bleach, title: 'Floyd the Barber', length: 2.18 )
Song.create!( album: bleach, title: 'About a Girl',     length: 2.48 )
## or bleach.create_song!()

