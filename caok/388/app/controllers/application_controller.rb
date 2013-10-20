class ApplicationController < ActionController::Base
  protect_from_forgery

private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def current_tenant
    Tenant.find_by_subdomain! request.subdomain
  end
  helper_method :current_tenant
end
