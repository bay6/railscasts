class Article < ActiveRecord::Base
  belongs_to :author
  has_many :comments
  attr_accessible :name, :published_at, :content
  scope :published, -> { where("published_at < ?", Time.zone.now) }

  def cached_comments_count
    Rails.cache.fetch([self, 'comments_count']) { comments.size }
  end

  def cached_comments
    Rails.cache.fetch([self, 'comments']) { comments.to_s }
  end

end
