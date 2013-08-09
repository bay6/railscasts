class SignupForm
  include ActiveModel::Model

  validates_presence_of :username
  validate_uniqueness_of :username
  validate_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/ 
  validates_length_of :password, minimum: 6
  validate :verify_unique_username

  delegate :username, :email, :password, :password_confirmation, to: :user
  delegate :twitter_name, :github_name, :bio, to: :profile


  def user
    @user ||= User.new
  end

  def profile
    @profile ||= user.build_profile
  end

  def subscribed
    subscribed_at
  end

  def subscribed=(checkbox)
    subscribed_at = Time.zone.now if checkbox == "1"
  end

  def generate_token
    begin
      self.token = SecureRandom.hex
    end while User.exists?(token: token)
  end

  def verify_unique_username
    if User.exists? username: username
      errors.add :username, "has already been taken"
    end
  end 
end
