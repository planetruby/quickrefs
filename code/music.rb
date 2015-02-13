###
## test music schema w/ ActiveRecord
##
##  todo: log sqlite schema to console and add here  as music.sqlite or music.sql ??
##

    create_table :artists do |t|
      t.column :name,   :string, :null => false, :limit => 100
      t.column :created_on, :timestamp, :null => false
      t.column :updated_on, :timestamp, :null => false
    end

    create_table :albums do |t|
      t.column :release_name, :string, :null => false
      t.column :year, :date
      t.column :created_on, :timestamp, :null => false
      t.column :updated_on, :timestamp, :null => false
      t.column :artist_id, :integer, :null => false
    end

    create_table :songs do |t|
      t.column :title, :string, :null => false
      t.column :length, :decimal, :precision => 6, :scale => 2
      t.column :created_on, :timestamp, :null => false
      t.column :updated_on, :timestamp, :null => false
      t.column :album_id, :integer, :null => false
    end
