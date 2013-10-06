class SearchSuggustion < ActiveRecord::Base
  attr_accessible :popular, :term

  def self.term_for(prefix)
    $redis.zrevrange "search_suggustions:#{prefix.downcase}", 0, 9
  end

  def self.index_products
    Product.find_each do |product|
      index_term(product.name)
      index_term(product.category)
      product.name.split.each {|t| index_term(t) }
    end
  end

  def self.index_term(term)
    1.upto(term.length - 1) do |n|
      prefix = term[0, n]
      $redis.zincrby "search_suggustions:#{prefix.downcase}", 1, term
    end
  end
end
