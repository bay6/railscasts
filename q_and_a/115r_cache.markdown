#### to_a

```ruby
  def cached_comments
    Rails.cache.fetch([self, 'comments']) { comments.to_a }
  end
```

What's that to_a for?


#### About cache_key

cache key bind with updated at

```ruby
1.9.3-p429 :014 > Article.first.created_at.strftime("%T")
  Article Load (0.3ms)  SELECT "articles".* FROM "articles" LIMIT 1
 => "01:57:34"
1.9.3-p429 :015 > Article.first.updated_at.strftime("%T")
  Article Load (0.2ms)  SELECT "articles".* FROM "articles" LIMIT 1
 => "12:39:16"
1.9.3-p429 :016 > Article.first.cache_key
  Article Load (0.3ms)  SELECT "articles".* FROM "articles" LIMIT 1
 => "articles/1-20130819123916"
```
