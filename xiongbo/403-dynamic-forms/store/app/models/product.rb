class Product < ActiveRecord::Base
  attr_accessible :name, :price, :product_type_id, :properties
  belongs_to :product_type
  serialize :properties, Hash
end
