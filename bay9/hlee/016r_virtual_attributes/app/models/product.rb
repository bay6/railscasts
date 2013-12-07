class Product < ActiveRecord::Base
  attr_accessible :name, :price_in_dollars, :released_at_text, :category_id
  belongs_to :category
  has_many :taggings
  has_many :tags, through: :taggings

  validates_presence_of :released_at

  def price_in_dollars
    price_in_cents.to_d / 100 if price_in_cents
  end

  def price_in_dollars=(dollars)
    self.price_in_cents = dollars.to_d * 100 if dollars.present?
  end

  def released_at_text
    released_at.try(:strftime, "%Y-%m-%d %H:%M:%S")
  end

  def released_at_text=(time)
    self.released_at = Time.zone.parse(time) if time.present?
  rescue ArgumentError
    self.released_at = nil
  end

end
