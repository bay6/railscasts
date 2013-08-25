class Product < ActiveRecord::Base
  attr_accessible :name, :price, :category_id
  belongs_to :category
  has_many :reviews
  def category_name
    read_attribute('category_name') || category.name
  end

  def self.category_and_review
    joins(:category, :reviews)
  end

  def self.category_and_review_and_user
    joins(:category, :reviews => :user)
  end

  def self.customize_category
    joins('left outer join categories on category_id = categories.id')
  end

end
