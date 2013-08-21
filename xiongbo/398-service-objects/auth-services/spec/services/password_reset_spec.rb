require 'spec_helper'

describe PasswordReset do
  let(:user) { create(:user) }
  let(:password_reset) { PasswordReset.new(user) }

  describe '#send_password_reset' do
    it "generates a unique password_reset_token each time" do
      password_reset.send_email
      last_token = user.password_reset_token
      password_reset.send_email
      user.password_reset_token.should_not eq(last_token)
    end

    it "saves the time the password reset was sent" do
      password_reset.send_email
      user.reload.password_reset_sent_at.should be_present
    end

    it "delivers email to user" do
      password_reset.send_email
      last_email.to.should include(user.email)
    end
  end

  describe '#password_reset_expired?' do
    it "if sent over two hours ago" do
      user.password_reset_sent_at = Time.zone.now
      password_reset.should_not be_expired
      user.password_reset_sent_at = 3.hours.ago
      password_reset.should be_expired
    end
  end
end
