class Product < ActiveRecord::Base
  attr_accessible :name, :price, :released_on, :category_id
  belongs_to :category
end
