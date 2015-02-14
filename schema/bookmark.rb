####
# sample schema - social bookmarks/links w/ tags (delicious-style)
#
#  add votes (a la reddit) - why?? why not  ????


create_table :users do |t|
  t.string  :name,           index: true
  t.string  :full_name
  t.string  :email
  t.string  :password_digest   # use password_hash - why, why not??
  t.timestamps
end

create_table :bookmarks do |t|
  t.references :user
  t.string     :url
  t.string     :url_digest,  index: true     # use url_hash - why, why not??
  t.string     :short_description
  t.text       :long_description
  t.boolean    :public
  t.timestamps
end

create_table :user_bookmarks do |t|
  t.references :user
  t.references :bookmark
end

create_table :tags do |t|
  t.string :name,    index: true
end

create_table :taggings do |t|
  t.references :tag
  t.references :taggable, polymorphic: true
end

add_index :taggings, [:tag_id, :taggable_id, :taggable_type]


