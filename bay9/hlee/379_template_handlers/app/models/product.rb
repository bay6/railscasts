class Product < ActiveRecord::Base
  has_many :reviews
  attr_accessible :name, :price, :released_on
end
