class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # hack for cancan
  # https://github.com/ryanb/cancan/issues/835
  before_filter do
    resource = controller_path.singularize.gsub('/', '_').to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end

  helper_method :current_user

  def current_user
    @current_user ||= User.cache_find(session[:user_id])
  end

  def current_user= user
    @current_user = user
    session[:user_id] = user.try(:id)
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :notice => t("error.require_permission")
  end

end
