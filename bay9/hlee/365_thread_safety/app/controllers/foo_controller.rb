class FooController < ApplicationController
  @@counter = 0
  @@mutex = Mutex.new
  
  def bar
    # @@mutex.synchronize do
      counter = @@counter
      sleep 1
      counter += 1
      @@counter = counter
    # end
    render text: "#{@@counter}\n"
  end
end
