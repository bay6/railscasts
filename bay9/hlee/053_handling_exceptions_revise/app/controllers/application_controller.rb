class ApplicationController < ActionController::Base
  protect_from_forgery
  rescue_from 'ProductsController::Forbidden', with: :forbidden
  
private
  def forbidden(exception)
    render text: exception.message
  end
end
