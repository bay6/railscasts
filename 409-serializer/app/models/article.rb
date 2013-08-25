class Article < ActiveRecord::Base
  belongs_to :author
  has_many :comments
  attr_accessible :content, :name, :published_at, :author, :author_id
end
