class Author < ActiveRecord::Base
  has_many :articles
  attr_accessible :name
end
