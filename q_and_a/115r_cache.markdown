### to_a

```ruby
  def cached_comments
    Rails.cache.fetch([self, 'comments']) { comments.to_a }
  end
```

What's that to_a for?