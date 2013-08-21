class User
  module PasswordResettable
    extend ActiveSupport::Concern

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
end
