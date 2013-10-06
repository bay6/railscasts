class SearchSuggustion < ActiveRecord::Base
  attr_accessible :popular, :term

  def self.term_for(prefix)
    where("term like ?", "#{prefix}_%")
    .order("popular desc").pluck(:term)
  end

  def self.index_products
    Product.find_each do |product|
      index_term(product.name)
      index_term(product.category)
      product.name.split.each {|t| index_term(t) }
    end
  end

  def self.index_term(term)
    where(term: term.downcase).first_or_initialize.tap do |suggustion|
      suggustion.increment! :popular
    end
  end
end
