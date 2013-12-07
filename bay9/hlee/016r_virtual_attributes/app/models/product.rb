class Product < ActiveRecord::Base
  attr_accessible :name, :price_in_dollars, :released_at_text, :category_id, :new_category, :tag_names
  belongs_to :category
  has_many :taggings
  has_many :tags, through: :taggings
  attr_writer :released_at_text, :tag_names
  before_save :save_released_at_text
  validate :check_released_at_text
  attr_accessor :new_category

  before_save :create_category

  def tag_names
    @tag_names || tags.pluck(:name).join(' ')
  end

  def create_category
    self.category = Category.create(name: new_category) if new_category.present?
  end

  def price_in_dollars
    price_in_cents.to_d / 100 if price_in_cents
  end

  def price_in_dollars=(dollars)
    self.price_in_cents = dollars.to_d * 100 if dollars.present?
  end


  def released_at_text
    @released_at_text || released_at.try(:strftime, "%Y-%m-%d %H:%M:%S")
  end
  
  def save_released_at_text
    self.released_at = Time.zone.parse(@released_at_text) if @released_at_text.present?
  end
  
  def check_released_at_text
    if  @released_at_text.present? && Time.zone.parse(@released_at_text).nil?
      errors.add :released_at_text, "cannot be parsed"
    end
  rescue ArgumentError
    errors.add :released_at_text, "is out of range"   
  end

end
