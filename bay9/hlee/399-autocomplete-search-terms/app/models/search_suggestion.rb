class SearchSuggestion < ActiveRecord::Base
  attr_accessible :popularity, :term

  #def self.terms_for(prefix)
    #Rails.cache.fetch(["search-term", prefix]) do
      #suggestions = where("term like ?", "#{prefix}_%")
      #suggestions.order("popularity desc").limit(10).pluck(:term)
    #end
  #end

  def self.terms_for(prefix)
    $redis.zrevrange "search-suggestions:#{prefix.downcase}", 0, 9
  end 


  def self.index_products
    Product.find_each do |product|
      index_term(product.name)
      product.name.split.each { |t| index_term(t) }
      index_term(product.category)
    end
  end

  #def self.index_term(term)
    #where(term: term.downcase).first_or_initialize.tap do |suggestion|
      #suggestion.increment! :popularity
    #end
  #end  

  def self.index_term(term)
    1.upto(term.length - 1) do |n|
      prefix = term[0, n]
      $redis.zincrby "search-suggestions:#{prefix.downcase}", 1, term.downcase
    end
  end

end
