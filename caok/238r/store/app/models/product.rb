class Product
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paranoia
  include Mongoid::Versioning

  field :name, type: String
  field :price, type: BigDecimal
  field :released_on, type: Date
  field :_id, type: String, default: ->{ name.to_s.parameterize }

  attr_accessible :name, :price, :released_on

  validates_presence_of :name

  embeds_many :reviews
end
