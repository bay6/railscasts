class Article < ActiveRecord::Base
  has_many :comments

  # http://guides.rubyonrails.org/active_record_callbacks.html#transaction-callbacks
  after_commit :flush_cache
  # after_commit and after_rollback. These callbacks are very similar to the after_save callback except that they don't execute until after database changes have either been committed or rolled back.

  def self.cached_find(id)
    Rails.cache.fetch([name, id], expires_in: 5.minutes) { find(id) }
    #this "name" is class name
    #pry(Article)> self
    #=> Article(id: integer, name: string, content: text, published_at: datetime, created_at: datetime, updated_at: datetime)
  end

  def flush_cache
    Rails.cache.delete([self.class.name, id])
  end

  def cached_comments_count
    Rails.cache.fetch([self, 'comments_count']) { comments.size }
  end

  def cached_comments
    Rails.cache.fetch([self, 'comments']) { comments.to_a }
  end
end
