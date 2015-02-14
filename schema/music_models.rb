

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

