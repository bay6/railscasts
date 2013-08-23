require 'spec_helper'

describe User do

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
end
