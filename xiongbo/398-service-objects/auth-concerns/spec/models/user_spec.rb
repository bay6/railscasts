require 'spec_helper'

describe User do
  describe '.authenticate' do
    it "returns user only if username and password match" do
      user = create(:user, username: "foobar", password: "secret")
      User.authenticate("foobar", "secret").should eq(user)
      User.authenticate("foobar2", "secret").should be_nil
      User.authenticate("foobar", "secret2").should be_nil
    end
  end

  describe '.from_omniauth' do
    it "finds a user record matching uid/provider and updates username" do
      user = create(:user, username: "foobar", provider: "foo", uid: "123")
      user2 = User.from_omniauth(provider: "foo", uid: "123", info: {nickname: "newfoo"})
      user.should eq(user2)
      user2.username.should eq("newfoo")
    end
  end

  describe '.search' do
    it "finds users matching username or email" do
      user = create(:user, username: "foobar", email: "foobar@example.com")
      User.search("foobar").should eq([user])
      User.search("foobar@example.com").should eq([user])
      User.search("foobar2").should_not eq([user])
    end
  end

  describe '.to_csv' do
    it "returns the records in CSV format" do
      user = create(:user)
      csv = User.where(id: user.id).to_csv
      rows = [%w[id username email], [user.id.to_s, user.username, user.email]]
      csv.split("\n").map { |r| r.split(",") }.should eq(rows)
    end
  end

  describe '#send_invitation' do
    it "delivers email and increments count" do
      user = create(:user)
      user.send_invitation("foo@example.com")
      user.invitation_count.should eq(1)
      last_email.to.should include("foo@example.com")
    end
  end

  describe '#reached_invitation_limit?' do
    it "if invitation count is more than 5" do
      user = build(:user)
      user.invitation_count = 5
      user.reached_invitation_limit?.should be_false
      user.invitation_count = 6
      user.reached_invitation_limit?.should be_true
    end
  end

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
