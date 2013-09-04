class Product < ActiveRecord::Base
  belongs_to :category
  attr_accessible :name, :price, :discontinued, :category_id, :price_modification
  validates_numericality_of :price

  attr_reader :price_modification

  def price_modification=(new_price)
    @price_modification = new_price
    if new_price.to_s.ends_with? "%"
      self.price += (price * (new_price.to_d/100)).round(2)
    else
      self.price = new_price
    end
  end
end
