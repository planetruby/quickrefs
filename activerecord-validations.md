# ActiveRecord Quick Reference (Cheat Sheet)

## Validations

**Validate checkboxes**

~~~
class Person < ActiveRecord::Base
  validates :terms_of_service, :acceptance => true
end
~~~

**Validate associated records**

~~~
class Library < ActiveRecord::Base
  has_many :books
  validates_associated :books
end
~~~

**Confirmations (like passwords)**

~~~
class Person < ActiveRecord::Base
  validates :email, :confirmation => true
end
~~~

**Validate format**

~~~
class Product < ActiveRecord::Base
  validates :legacy_code, :format => { :with => /\A[a-zA-Z]+\z/,
    :message => "Only letters allowed" }
end
~~~

**Validate length**

~~~
class Person < ActiveRecord::Base
  validates :name, :length => { :minimum => 2 }
  validates :bio, :length => { :maximum => 500 }
  validates :password, :length => { :in => 6..20 }
  validates :registration_number, :length => { :is => 6 }

  validates :content, :length => {
    :minimum   => 300,
    :maximum   => 400,
    :tokenizer => lambda { |str| str.scan(/\w+/) },
    :too_short => "must have at least %{count} words",
    :too_long  => "must have at most %{count} words"
  }
end
~~~

**Numeric**

~~~
class Player < ActiveRecord::Base
  validates :points, :numericality => true
  validates :games_played, :numericality => { :only_integer => true }
end
~~~

**Non-empty**

~~~
class Person < ActiveRecord::Base
  validates :name, :login, :email, :presence => true
end
~~~


**Custom**

~~~
class Person < ActiveRecord::Base
  validate :foo_cant_be_nil

  def foo_cant_be_nil
    errors.add(:foo, 'cant be nil')  if foo.nil?
  end
end
~~~


