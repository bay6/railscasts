class Article < ActiveRecord::Base
  belongs_to :author
  has_many :comments
  attr_accessible :name, :published_at, :content
  scope :published, -> { where("published_at < ?", Time.zone.now) }
  after_commit :flush_cache

  def cached_comments_count
    Rails.cache.fetch([self, 'comments_count']) { comments.size }
  end

  def cached_comments
    Rails.cache.fetch([self, 'comments']) { comments }
  end

  def self.cached_find(id)
    Rails.cache.fetch([name, id]) { find(id) }
  end

  def flush_cache
    Rails.cache.delete([slef.class.name, id])
  end

  def cached_author
    Author.cached_find(author_id)
  end
 
end
