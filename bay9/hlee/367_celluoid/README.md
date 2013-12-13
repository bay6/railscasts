# RailsCasts Episode #367: Celluloid

http://railscasts.com/episodes/367-celluloid

Requires Ruby 1.9.2 or higher.


### Commands used in this episode

```
gem install celluloid
irb -r ./rocket
ruby feed_counter.rb http://rss.cnn.com/rss/cnn_topstories.rss http://feeds.feedburner.com/railscasts http://stackoverflow.com/feeds
irb -r ./feed_counter
```

### Commands used in irb

```ruby
r = Rocket.new
r.launch
r.launch!
r2 = Rocket.new
Thread.list.size
r.launch!; r2.launch!
l = Launcher.new
l.launch_rocket
Rocket.supervise(true)
f = FeedCounter.new("http://feeds.feedburner.com/railscasts")
future = f.future(:count)
future.value
```

