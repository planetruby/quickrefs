
class User     < ActiveRecord::Base
  has_many :bookmarks, :dependent => :destroy
  
  validates :name, uniqueness: true
  validates :full_name, presence: true
  validates :email,     presence: true
end


class Bookmark  < ActiveRecord::Base
  belongs_to :user
  
  ## add acts_as_taggable
  
  validates :user_id,           presence: true
  validates :url,               presence: true
  validates :short_description, presence: true
end


