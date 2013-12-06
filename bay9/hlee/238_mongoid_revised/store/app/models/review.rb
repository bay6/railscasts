class Review
  include Mongoid::Document
  field :content, type: String

  embedded_in :product
end
