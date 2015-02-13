# ActiveRecord Quick Reference (Cheat Sheet)

## Associations / Relationships

~~~
belongs_to
has_one
has_many
has_many :through
has_one :through
has_and_belongs_to_many
~~~

### belongs_to

~~~
belongs_to :author,
  class_name: 'User',
  dependent: :destroy  // delete this
~~~

### has_many

~~~
has_many :comments, :order => "posted_on"
has_many :comments, :include => :author
has_many :people, :class_name => "Person", :conditions => "deleted = 0", :order => "name"
has_many :tracks, :order => "position", :dependent => :destroy
has_many :comments, :dependent => :nullify
has_many :tags, :as => :taggable
has_many :reports, :readonly => true
has_many :subscribers, :through => :subscriptions, :source => :user
has_many :subscribers, :class_name => "Person", :finder_sql =>
    'SELECT DISTINCT people.* ' +
    'FROM people p, post_subscriptions ps ' +
    'WHERE ps.post_id = #{id} AND ps.person_id = p.id ' +
    'ORDER BY p.first_name'
~~~




### One-to-One

~~~
class Country < ActiveRecord::Base 
  belongs_to :place
end 
 
class Place < ActiveRecord::Base
  has_one :country
end
~~~

in your schema

~~~
create_table country
  t.reference place  # place_id  -- note: belongs_to incl. foreign key ref
end
  
create_table place
end

join condition  =>  country.place_id == place.id
~~~


### One-to-Many

~~~
class Country < ActiveRecord::Base 
  belongs_to :continent
end 
 
class Continent < ActiveRecord::Base
  has_many :countries
end
~~~

in your schema

~~~
create_table countries
 t.references continent  # continent_id  -- note: belongs_to incl. foreign key ref
end

create_table continents
end

join condition  =>   countries.continent_id == continents.id
~~~




### Many-to-Many

~~~
class Programmer < ActiveRecord::Base
  has_many :assignments
  has_many :projects, :through => :assignments
end

class Project < ActiveRecord::Base
  has_many :assignments
  has_many :programmers, :through => :assignments
end

class Assignment
  belongs_to :project
  belongs_to :programmer
end
~~~


~~~
class Article
  has_many :authorships
  has_many :authors, :through => authorships
end

class Author
  has_many :authorships
  has_many :articles, :through => authorships
end

class Authorship   # join table
  belongs_to :article
  belongs_to :author
end
~~~

in your schema

~~~
create_table articles
end

create_table authorships  # join table
  t.references article    # article_id foreign key
  t.references author     # author_id foreign key
end

create_table authors
end
~~~


?? add generated selects ??



**Or has_and_belongs_to_many (HABTM)**:

"Hidden" join table in model

~~~
class Article
  has_and_belongs_to_many :authors
end

class Author
  has_and_belongs_to_many :articles
end
~~~

in your schema

~~~
create_table articles
end

create_table articles_authors  # join table
  t.references article         # article_id foreign key
  t.references author          # author_id foreign key
end

create_table authors
end
~~~




~~~
has_and_belongs_to_many :projects
has_and_belongs_to_many :projects, :include => [ :milestones, :manager ]
has_and_belongs_to_many :nations, :class_name => "Country"
has_and_belongs_to_many :categories, :join_table => "prods_cats"
has_and_belongs_to_many :categories, :readonly => true
has_and_belongs_to_many :active_projects, :join_table => 'developers_projects', :delete_sql =>
"DELETE FROM developers_projects WHERE active=1 AND developer_id = #{id} AND project_id = #{record.id}"
~~~

## Polymorphic associations

~~~
class Post
  has_many :attachments, :as => :parent
end

class Image
  belongs_to :parent, :polymorphic => true
end
~~~

in your schema

~~~
???
~~~


