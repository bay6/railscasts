# rails casts practice --413 fast tests

## resources
1. [binstubs](https://github.com/sstephenson/rbenv/wiki/Understanding-binstubs)

## useful tips
1. rspec spec/models -p #=> to show the top 10 slowest tests
2. running garbage collection only every 10 or 20 seconds when \
  running specs may increase performance dramatically
3. parallel tests is separate test cases to the parts by your cpu cores

## Q and A
1. what is build_stubbed works for?
2. min, sec = *seconds.divmod(60) => why to use * before seconds

## attention

```ruby
  bundle binstubs rspec-core # this will make a file that we can run
  time bin/rspec spec/models 

  # you can custom rspec filter 
  it "scopes published episodes", :current do

  config.filter_run current: true
  config.filter_sun_excluding :slow unless ENV["SLOW"] 
```


