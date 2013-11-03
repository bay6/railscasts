class Product < ActiveRecord::Base
  attr_accessible :name, :price, :released_on
  has_many :views
end
