

class CreateMusicDb < ActiveRecord::Migration

def up

  ###.. load w/ class eval ??

end # method up

def down
  raise ActiveRecord::IrreversibleMigration
end
end # class CreateMusicDb

