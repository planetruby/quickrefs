
class Photo  <  ActiveRecord::Base
  has_many :slides
  has_and_belongs_to_many :categories

  validates :filename, presence: true
end


class Slideshow < ActiveRecord::Base
  has_many :slides     ### todo: add :order => :position
  has_many :photos, :through => :slides
end


class Slide   < ActiveRecord::Base
  belongs_to :slideshow
  belongs_to :photo

  ## acts_as_list :scope => 'slideshow_id'   -- todo: add ??
end


class Category  < ActiveRecord::Base
  has_and_belongs_to_many :photos
  
  ## acts_as_tree    -- todo: add ??
  
  def ancestors_name
    if parent
      parent.ancestors_name + parent.name + ':'
    else
      ''
    end
  end

  def long_name
    ancestors_name + name
  end
end

