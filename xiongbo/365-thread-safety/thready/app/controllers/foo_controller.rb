class FooController < ApplicationController
  @@counter = 0
  @@mutex = Mutex.new

  def bar
      counter = @@counter
      sleep 1
      counter += 1
      @@counter = counter
    render text: "foobar\n"
  end
end
