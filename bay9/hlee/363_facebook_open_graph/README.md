### the way to test facebook open API

```ruby
u = User.last
u.facebook.put_connections("me", "lkvdemo:review", movie: "http://samples.ogp.me/453907197960619")
```
