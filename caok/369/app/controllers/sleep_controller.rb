class SleepController < ApplicationController
  def index
    sleep 2
    render nothing: true
  end
end
