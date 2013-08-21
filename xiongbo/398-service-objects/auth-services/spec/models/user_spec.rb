require 'spec_helper'

describe User do 
  describe '#send_password_reset' do
    let(:user) { create(:user) }

    it "generates a unique password_reset_token each time" do
      user.send_password_reset
      last_token = user.password_reset_token
      user.send_password_reset
      user.password_reset_token.should_not eq(last_token)
    end

    it "saves the time the password reset was sent" do
      user.send_password_reset
      user.reload.password_reset_sent_at.should be_present
    end

    it "delivers email to user" do
      user.send_password_reset
      last_email.to.should include(user.email)
    end
  end

  describe '#password_reset_expired?' do
    it "if sent over two hours ago" do
      user = build(:user)
      user.password_reset_sent_at = Time.zone.now
      user.password_reset_expired?.should be_false
      user.password_reset_sent_at = 3.hours.ago
      user.password_reset_expired?.should be_true
    end
  end
end
