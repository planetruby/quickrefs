###################################
# photo slideshow/gallery schema


create_table  :photo do |t|
  t.string     :filename
end

create_table  :slideshows do |t|
  t.string   :title
  t.timestamps
end

create_table  :slides do |t|
  t.integer    :position
  t.references :slideshow
  t.references :photo
end

create_table  :categories do |t|
  t.string     :name
  t.references :parent
end

create_table :categories_photos do |t|
  t.references :category
  t.references :photo
end

