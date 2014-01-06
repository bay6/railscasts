class HomeController < ApplicationController
  def index
  end

  private
  def use_https?
    false
  end
end
