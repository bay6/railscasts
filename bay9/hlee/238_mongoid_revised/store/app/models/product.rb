class Product
  include Mongoid::Document
  field :name, type: String
  field :price, type: BigDecimal
end
