class PasswordReset
  attr_reader :user

  def self.from_email(email)
    new User.find_by_email(email)
  end

  def self.from_token(token)
    new User.find_by_password_reset_token!(token)
  end

  def initialize(user)
    @user = user
  end

  def send_email
    generate_token
    user.password_reset_sent_at = Time.zone.now
    user.save!
    UserMailer.password_reset(user).deliver
  end

  def expired?
    user.password_reset_sent_at < 2.hours.ago
  end

private

  def generate_token
    begin
      user.password_reset_token = SecureRandom.hex
    end while User.exists?(password_reset_token: user.password_reset_token)
  end
end
