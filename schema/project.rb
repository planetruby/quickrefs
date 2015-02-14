###########################################
#  project schema w/ ActiveRecord
#
#
#  projects
#  milestone
#  tasks
#
# more -> code.tutsplus.com/tutorials/create-beautiful-administration-interfaces-with-active-admin--net-21729
#
#  check redmine 
#    database model?
#
#



class CreateProjectDb < ActiveRecord::Migration

def up
end # method up

def down
  raise ActiveRecord::IrreversibleMigration
end
end # class CreateMusicDb


#### models



class Task < ActiveRecord::Base
  belongs_to :project
  belongs_to :admin_user
 
  validates :title, :project_id, :admin_user_id, :presence => true
  validates :is_done, :inclusion => { :in => [true, false] }
end

scope :all, :default => true
scope :due_this_week do |tasks|
  tasks.where('due_date > ? and due_date < ?', Time.now, 1.week.from_now)
end
scope :late do |tasks|
  tasks.where('due_date < ?', Time.now)
end
scope :mine do |tasks|
  tasks.where(:admin_user_id => current_admin_user.id)
end






