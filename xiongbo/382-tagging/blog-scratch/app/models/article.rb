class Article < ActiveRecord::Base
  attr_accessible :content, :name, :tag_list
  has_many :taggings
  has_many :tags, through: :taggings

  class << self
    def tagged_with name
      Tag.find_by_name!(name).articles
    end

    def tag_counts
      Tag.select("tags.*, count(taggings.tag_id) as count").
        joins(:taggings).group("taggings.tag_id")
    end
  end

  def tag_list
    tags.map(&:name).join(", ")
  end

  def tag_list=(names)
    self.tags = names.split(',').map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end
end
