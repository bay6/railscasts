### learn

1. rack lock
2. Mutex.new
3. how to synchronize


```ruby
  def bar
    @@mutex.synchronize do
      counter = @@counter
      sleep 1
      counter += 1
      @@counter = counter
    end
    render text: "#{@@counter}\n"
  end
```
