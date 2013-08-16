class Product < ActiveRecord::Base
  attr_accessible :name, :price, :category_id
  belongs_to :category
  has_many :reviews
end
