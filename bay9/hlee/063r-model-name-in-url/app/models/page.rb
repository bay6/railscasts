class Page < ActiveRecord::Base
  attr_accessible :parent_id, :content, :name

  validates :slug, uniqueness: true, presence: true
  before_validation :generate_slug
  
  has_ancestry

  def to_param
    slug
  end

  def generate_slug
    self.slug ||= name.parameterize
  end
end
