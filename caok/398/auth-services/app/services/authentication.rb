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
    User.where(@omniauth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = @omniauth[:provider]
      user.uid = @omniauth[:uid]
      user.username = @omniauth[:info][:nickname]
      user.save!
    end
  end

  def user_with_password
    user = User.find_by_username(@params[:username])
    user && user.authenticate(@params[:password])
  end
end
