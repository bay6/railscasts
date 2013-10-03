require 'spec_helper'

describe Invitation do
  describe '#send_invitation' do
    it "delivers email and increments count" do
      user = create(:user)
      Invitation.new(user).deliver("foo@example.com")
      user.invitation_count.should eq(1)
      last_email.to.should include("foo@example.com")
    end
  end

  describe '#at_limit?' do
    it "if invitation count is more than 5" do
      user = build(:user)
      user.invitation_count = 5
      Invitation.new(user).should_not be_at_limit
      user.invitation_count = 6
      Invitation.new(user).should be_at_limit
    end
  end
end
