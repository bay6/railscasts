class Product
  include Mongoid::Document
  field :name, type: String
  field :price, type: BigDecimal
  field :released_on, type: Date

  attr_accessible :name, :price, :released_on

  validates_presence_of :name
end
