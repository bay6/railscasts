class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authorize

  delegate :allow?, to: :current_permission
  helper_method :allow?

  delegate :allow_param?, to: :current_permission
  helper_method :allow_param?

private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def current_resource
    nil
  end 

  def authorize
    unless current_permission.allow?(params[:controller], params[:action], current_resource)
      redirect_to root_url, alert: "Not authorized" 
    end
  end

  def current_permission
    @current_permission ||= Permission.new current_user
  end 
end
