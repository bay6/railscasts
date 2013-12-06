class Product
  include Mongoid::Document
  field :_id, type: String, default: -> { name.to_s.parameterize }
  field :name, type: String
  field :price, type: BigDecimal
  field :released_on, type: Date

  validates_presence_of :name
  embeds_many :reviews
end
