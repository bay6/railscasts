class Product < ActiveRecord::Base
  attr_accessible :name, :price_in_dollars, :released_at, :category_id
  belongs_to :category
  has_many :taggings
  has_many :tags, through: :taggings

  def price_in_dollars
    price_in_cents.to_d / 100 if price_in_cents
  end

  def price_in_dollars=(dollars)
    self.price_in_cents = dollars.to_d * 100 if dollars.present?
  end
end
