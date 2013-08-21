class Authentication
  def initialize(params, omiauth = nil)
    @params = params
    @omiauth = omiauth
  end 

  def user
    @user ||= @omiauth ? user_from_omiauth : user_from_password
  end

  def authenticated?
    user.present?
  end

  private

  def user_from_omiauth
    User.where(@omiauth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = @omiauth[:provider]
      user.uid = @omiauth[:uid]
      user.username = @omiauth[:info][:nickname]
      user.save!
    end
  end

  def user_from_password
    user = User.find_by_username(@params[:username])
    user && user.authenticate(@params[:password])
  end
end
