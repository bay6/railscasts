class Article < ActiveRecord::Base
  attr_accessible :content, :name, :tag_list
  has_many :taggings
  has_many :tags, through: :taggings
end
