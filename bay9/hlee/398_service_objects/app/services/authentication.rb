class Authentication
  def initialize(params, omniauth = nil)
    @params = params
    @omniauth = omniauth
  end

  def user
    @user ||= @omniauth ? user_from_omniauth : user_with_password
  end

  def authenticated?
    user.present?
  end

private

  def user_from_omniauth
    User.where(@omniauth.slice(:provider, :uid)).first_or_initialize.tap do |usr|
      usr.provider = @omniauth[:provider]
      usr.uid = @omniauth[:uid]
      usr.username = @omniauth[:info][:nickname]
    end
  end

  def user_with_password
    usr = User.find_by_username(@params[:username])
    usr and usr.authenticate(@params[:password])
  end

end
