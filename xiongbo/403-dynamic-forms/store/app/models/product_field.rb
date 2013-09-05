class ProductField < ActiveRecord::Base
  belongs_to :product_type
  attr_accessible :required, :field_type, :name
end
