class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :miniprofiler
  private
  def miniprofiler
    <`2`>Rack::MiniProfiler.authorize_request if user.admin?
  end
end
