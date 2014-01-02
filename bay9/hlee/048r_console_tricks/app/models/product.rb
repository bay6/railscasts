class Product < ActiveRecord::Base
  belongs_to :category
  attr_accessible :name, :price, :released_on, :category, :category_id
  
  def to_param
    "#{id}-#{name.parameterize}"
  end
end
