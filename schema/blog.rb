###################
#  simple blog schema
#   (for follower/followee see the social schema)
#
#  see blog in five minutes - as an example ??


create_table :posts do |t|
  t.string     :title
  t.text       :content    # use body - why, why not??
  t.timestamps
end

create_table :comments do |t|
  t.references :post
  t.string     :author    ## check: add user table? why for comment? just use author as string ??
  t.text       :content   # use body - why, why not??
  t.timestamps
end


