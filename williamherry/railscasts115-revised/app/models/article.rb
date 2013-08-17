class Article < ActiveRecord::Base
  belongs_to :author
  has_many :comments
  attr_accessible :name, :published_at, :content
  scope :published, -> { where("published_at < ?", Time.zone.now) }

  after_commit :flush_cache

  def self.cached_published
    # updated_at = published.maximum(:updated_at)
    Rails.cache.fetch([name, "published"], expires_in: 5.minutes) do
      published.to_a
    end
  end

  def self.cached_find(id)
    Rails.cache.fetch([name, id]) { find(id) }
  end

  def flush_cache
    Rails.cache.delete([self.class.name, id])
    Rails.cache.delete([self.class.name, "published"])
  end

  def cached_comments_count
    Rails.cache.fetch([self, "comments_count"]) { comments.size }
  end

  def cached_comments
    Rails.cache.fetch([self, "comments"]) { comments.to_a }
  end

  def cached_author
    Author.cached_find(author_id)
  end
end
