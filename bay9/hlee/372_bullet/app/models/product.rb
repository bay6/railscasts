class Product < ActiveRecord::Base
  belongs_to :category, counter_cache: true
  attr_accessible :name, :price, :category_id
end
