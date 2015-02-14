######################################
# student class registration schema
#
#  use event?  - add venues?? and performers(teachers) ??
#  add grades ??


create_table :students do |t|
  t.string :name
end

create_table :courses do |t|    ## note: class will  conflict w/ Class!! - use courses instead
  t.string :name
end

create_table :registrations do |t|   ## use attendance ??
  t.references :student
  t.references :course
end

