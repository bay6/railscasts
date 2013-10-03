class SearchSuggestion < ActiveRecord::Base
  attr_accessible :popularity, :term

  def self.terms_for(prefix)
    Rails.cache.fetch(["search-terms", prefix]) do
      suggestions = where("term like ?", "#{prefix}_%")
      suggestions.order("popularity desc").limit(10).pluck(:term)
    end
  end

  def self.index_products
    Product.find_each do |product|
      index_term(product.name)
      index_term(product.category)
      product.name.split.each { |t| index_term(t) }
    end
  end

  def self.index_term(term)
    where(term: term.downcase).first_or_initialize.tap do |suggestion|
      suggestion.increment! :popularity
    end
  end
end
