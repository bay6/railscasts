class SignupForm
  # Rails 4: include ActiveModel::Model
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  def persisted?
    false
  end

  validates_presence_of :username
  validate :verify_unique_username
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/
  validates_length_of :password, minimum: 6

  delegate :username, :email, :password, :password_confirmation, to: :user
  delegate :twitter_name, :github_name, :bio, to: :profile

  def user
    @user ||= User.new
  end

  def self.model_name
    ActiveModel::Name.new(self, nil, "User")
  end

  def profile
    @profile ||= user.build_profile
  end

  def submit(params)
    user.attributes = params.slice(:username, :email, :password, :password_confirmation)
    profile.attributes = params.slice(:twitter_name, :github_name, :bio)
    self.subscribed = params[:subscribed]
    if valid?
      generate_token
      user.save!
      profile.save!
    else
      false
    end
  end

  def subscribed
    user.subscribed_at
  end

  def subscribed=(checkbox)
    user.subscribed_at = Time.zone.now if checkbox == "1"
  end

  def generate_token
    begin
      user.token = SecureRandom.hex
    end while User.exists?(token: user.token)
  end

  def verify_unique_username
    if User.exists? username: username
      errors.add :username, 'has already been taken'
    end
  end

end
