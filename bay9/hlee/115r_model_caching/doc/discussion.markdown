### Rails Cache & Rails Cache

* other store

```ruby
config.cache_store = :mem_cache_store
config.cache_store = :memcached_store
config.cache_store = :redis_store
```
* touch

```ruby
class Comment < ActiveRecord::Base
  belongs_to :article, touch: true
  attr_accessible :name, :content
end
```

[touch instruction](http://api.rubyonrails.org/classes/ActiveRecord/Associations/ClassMethods.html)

* why use touch comments, not author

```ruby
class Author < ActiveRecord::Base
  has_many :articles
  attr_accessible :name

  after_commit :flush_cache

  def self.cached_find(id)
    Rails.cache.fetch([name, id], expires_in: 5.minutes) { find(id) }
  end

  def flush_cache
    Rails.cache.delete([self.class.name, id])
  end
end
```

[more cache to read](http://guides.rubyonrails.org/caching_with_rails.html)
