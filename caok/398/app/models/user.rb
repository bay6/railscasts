class User < ActiveRecord::Base
  attr_accessible :email, :username, :password, :password_confirmation

  validates_presence_of :username, :email
  validates_uniqueness_of :username
  validates_confirmation_of :password

  has_secure_password

  def self.authenticate(username, password)
    user = find_by_username(username)
    user if user && user.authenticate(password)
  end

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth[:provider]
      user.uid = auth[:uid]
      user.username = auth[:info][:nickname]
      user.save!
    end
  end

  def self.search(query)
    users = order("username")
    if query.present?
      users = users.where("email like :q or username like :q", q: query)
    end
    users
  end

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << %w[id username email]
      all.each do |user|
        csv << [user.id, user.username, user.email]
      end
    end
  end

  def send_invitation(email)
    UserMailer.invitation(self, email).deliver
    increment! :invitation_count
  end

  def reached_invitation_limit?
    invitation_count.to_i > 5
  end

  def send_password_reset
    generate_password_reset_token
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end

  def generate_password_reset_token
    begin
      self.password_reset_token = SecureRandom.hex
    end while User.exists?(password_reset_token: password_reset_token)
  end

  def password_reset_expired?
    password_reset_sent_at < 2.hours.ago
  end
end
