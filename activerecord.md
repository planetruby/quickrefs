# ActiveRecord Quick Reference (Cheat Sheet)


## Finders

~~~
Post.where(author: 'admin')
Post.where(author: 'admin').last
Post.find_by­(title: 'Rails 4', author: 'admin')
Post.find_or_initialize_by(title: 'Rails 4')
Post.find_or_create_by(title: 'Rails 4')
@post.update­(post_params) - preferred
@post.update_columns(post_params) - executes directly in database(skip validation)
~~~

## Scopes

~~~
scope :sold, ->{ where(state: 'sold') }
default_scope ->{ where(state: 'available') }
scope :recent, ->{ where(published_at: 2.weeks.ago) }
scope :recent_red, ->{ recent.where­(color: 'red') }
Post.where.not(author: author)
User.order(:name, created_at: :desc)
Post.includes(:comments).where(comments: { name: 'foo' })
Post.includes(:comments).where('comments.name' => 'foo')
Post.includes(:comments).order('comments.name')
~~~


~~~
items = Model.find_by_email(email)
items = Model.where(first_name: "Harvey")

item = Model.find(id)

item.serialize_hash
item.new_record?

item.create     # Same an #new then #save
item.create!    # Same as above, but raises an Exception

item.save
item.save!      # Same as above, but raises an Exception

item.update
item.update_attributes
item.update_attributes!

item.valid?
item.invalid?
~~~

## Joining

~~~
Student.joins(:schools).where(:schools => { :type => 'public' })
Student.joins(:schools).where('schools.type' => 'public' )
~~~


## Serialize

~~~
class User < ActiveRecord::Base
  serialize :preferences
end

user = User.create(:preferences => { "background" => "black", "display" => large })
~~~

## Overriding accessors

~~~
class Song < ActiveRecord::Base
  # Uses an integer of seconds to hold the length of the song

  def length=(minutes)
    write_attribute(:length, minutes.to_i * 60)
  end

  def length
    read_attribute(:length) / 60
  end
end
~~~

## Accessors (Set Attributes)

Method           | Uses Default Accessor | Saved to Database | Validations | Callbacks | Touches updated_at | Readonly check
---------------- | --------------------- | ----------------- | ----------- | --------- | -------------------| --------------
attribute=       |      Yes              |         -         |   (n/a)     |  (n/a)    |  (n/a)             |  (n/a)
write_attribute  |      -                |         -         |   (n/a)     |  (n/a)    |  (n/a)             |  (n/a)
update_attribute |      Yes              |         Yes       |   -         |  Yes      |  Yes               |  Yes
attributes=      |      Yes              |         -         |   (n/a)     |  (n/a)    |  (n/a)             |  (n/a)
update           |      Yes              |         Yes       |   Yes       |  Yes      |  Yes               |  Yes
update_column    |      -                |         Yes       |   -         |  -        |  -                 |  Yes
update_columns   |      -                |         Yes       |   -         |  -        |  -                 |  Yes
User::update     |      Yes              |         Yes       |   Yes       |  Yes      |  Yes               |  Yes
User::update_all |      -                |         Yes       |   -         |  -        |  -                 |  -



## Callbacks

~~~
after_create
after_initialize
after_validation
after_save
after_commit
~~~



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




## Connections

Establish a database connection:

~~~
ActiveRecord::Base.establish_connection( adapter: 'sqlite3', database: 'beer.db' )
~~~
 

## Usage

In Gemfile:

~~~
gem 'activerecord'         # Note: no underscore (_)
~~~

In Ruby:
~~~
require 'active_record'    # Note: use underscore (_)
~~~



### References

- [Rails Guide - Migrations]()
- [Rails API - Table Class ??]()
- [Different Ways to Set Attributes in ActiveRecord](http://www.davidverhasselt.com/set-attributes-in-activerecord/) by David Verhasselt


