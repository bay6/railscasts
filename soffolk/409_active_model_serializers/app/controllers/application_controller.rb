class ApplicationController < ActionController::Base
  protect_from_forgery
  serialization_scope :view_context

protected

  def current_user
    OpenStruct.new(admin?: false)
  end
  helper_method :current_user
end
