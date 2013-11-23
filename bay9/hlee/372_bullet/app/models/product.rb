class Product < ActiveRecord::Base
  belongs_to :category
  attr_accessible :name, :price, :category_id
end
