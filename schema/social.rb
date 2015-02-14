########
# blog schema
#

create_table  :user do |t|
  t.string     :name
  t.string     :email
  t.string     :password_hash   # use password_digest ??
  t.timestamps
end



### rename ??  - rename to subscriptions/followings - why, why not??
create_table  :follows do |t|
  t.references  :followed,  index: true      # use leader/following ??
  t.references  :follower,  index: true
  t.timestamps
end

# add_index :follows, :follower_id
# add_index :follows, :followed_id
add_index :follows, [:followed_id, :follower_id], unique: true


create_table :posts do |t|
  t.references :user,      index: true
  t.string     :title
  t.text       :content    # use body - why, why not??
  t.string     :url
  t.string     :type      # note: for single-table inheritance (STI)
  t.timestamps
end


create_table :comments do |t|
  t.references :post,  index: true
  t.references :user,  index: true
  t.text       :content    # use body - why, why not??
  t.timestamps
end


