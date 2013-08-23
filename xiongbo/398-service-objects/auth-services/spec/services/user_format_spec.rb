require 'spec_helper'

describe UserFormat do
  it "returns the records in CSV format" do
    user = create(:user)
    csv = UserFormat.new([user]).csv
    rows = [%w[id username email], [user.id.to_s, user.username, user.email]]
    csv.split("\n").map { |r| r.split(",") }.should eq(rows)
  end
end
