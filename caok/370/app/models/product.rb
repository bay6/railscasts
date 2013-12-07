class Product < ActiveRecord::Base
  belongs_to :category
  attr_accessible :name, :price, :released_on, :category_id
end
