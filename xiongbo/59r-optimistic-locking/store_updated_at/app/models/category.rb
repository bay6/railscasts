class Category < ActiveRecord::Base
  has_many :products
  attr_accessible :name
end
