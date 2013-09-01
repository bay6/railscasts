class Product < ActiveRecord::Base
  belongs_to :category
  attr_accessible :name, :price, :discontinued, :category_id
  validates_numericality_of :price
end
