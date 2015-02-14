
class Post   < ActiveRecord::Base
  belongs_to :user
  has_many   :comments, :dependent => :destroy

  validates :user_id, presence: true
  validates :type,    presence: true
end


class ImagePost  < Post
  validates :url, presence: true
end

class TextPost < Post
  validates :content, presence: true
end


class Comment < ActiveRecord::Base
  belongs_to :post, touch: true
  belongs_to :user
  
  validates :user_id, presence: true
end



class User < ActiveRecord::Base
  ## followings - people you follow
  has_many :follows,   :foreign_key => :follower_id, :dependent => :destroy
  has_many :followings, :through => :follows        ## source: :followed - needed too??

  ## followers - people following you
  has_many :reverse_follows, class_name: 'Follow', :foreign_key => :followed_id, dependent => :destroy
  has_many :followers, :through => :reverse_follows  ## source: :follower - needed too?

  has_many :posts,       :dependent => :destroy
  has_many :text_posts,  :dependent => :destroy
  has_many :image_posts, :dependent => :destroy

  has_many :comments, :dependent => :destroy


  validates :email, presence: true, uniqueness: true


  # Follows a user
  def follow( other_user )
    follows.create( followed_id: other_user.id )
  end

  # Unfollows a user
  def unfollow( other_user )
    follows.find_by( followed_id: other_user.id ).destroy
  end

  # Returns true if the current user is following the other user
  def following?( other_user )
    followings.include?( other_user )
  end

end # class User



class Follow  < ActiveRecord::Base    ## use Subscription/Relationship/Following - why, why not???
  belongs_to  :followed,  class_name: 'User'   ## change to leader/following ??
  belongs_to  :follower,  class_name: 'User'
end


