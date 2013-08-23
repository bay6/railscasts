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

end
