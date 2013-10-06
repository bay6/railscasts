class Product < ActiveRecord::Base
  attr_accessible :category, :name, :price

  def self.search(term)
    where("name like :term or category like :term", term: "%#{term}%")
  end
end
