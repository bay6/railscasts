class Product < ActiveRecord::Base
  attr_accessible :name, :price_in_cents, :released_at, :category_id
  belongs_to :category
  has_many :taggings
  has_many :tags, through: :taggings
end
