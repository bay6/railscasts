class ProductType < ActiveRecord::Base
  attr_accessible :name, :fields_attributes
  has_many :fields, class_name: "ProductField"
  accepts_nested_attrtibutes_for :fields, allow_destroy: true
end
