########
# quiz schema
#
#  quiz > questions > answers
#

g model quiz name:string
g model question quiz_id:integer content:text
g model answer question_id:integer content:string



class Quiz     < ActiveRecord::Base
  has_many :questions, :dependent => :destroy
end

class Question < ActiveRecord::Base
  belongs_to :quiz
  has_many   :answers, :dependent => :destroy
end

class Answer   < ActiveRecord::Base
  belongs_to :question
end

