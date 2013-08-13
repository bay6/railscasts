class Article < ActiveRecord::Base
  belongs_to :author
  has_many :comments
  attr_accessible :name, :published_at, :content
  scope :published, -> { where("published_at < ?", Time.zone.now) }
end
