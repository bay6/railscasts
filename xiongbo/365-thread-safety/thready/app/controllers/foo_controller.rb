class FooController < ApplicationController
  def bar
    sleep 1
    render text: "foobar\n"
  end
end
