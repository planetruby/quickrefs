###########################################
#   music schema w/ ActiveRecord
#


class CreateMusicDb < ActiveRecord::Migration

def up
  create_table :artists do |t|
    t.string      :name,    null: false, limit: 100
    t.timestamps
  end

  create_table :albums do |t|
    t.string      :title,   null: false
    t.references  :artist,  null: false
    t.integer     :year
    t.timestamps
  end

  create_table :songs do |t|
    t.string      :title,   null: false
    t.references  :album,   null: false
    t.decimal     :length,              precision: 6, scale: 2   # e.g. 9999.99 to -9999.99
    t.timestamps
    end

    ###################
    ## todo:
    ##  add indexes and foreign_keys

end # method up

def down
  raise ActiveRecord::IrreversibleMigration
end
end # class CreateMusicDb
