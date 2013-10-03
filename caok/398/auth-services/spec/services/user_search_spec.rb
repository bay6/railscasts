require 'spec_helper'

describe UserSearch do
  it "finds users matching username or email" do
    user = create(:user, username: "foobar", email: "foobar@example.com")
    UserSearch.new("foobar").users.should eq([user])
    UserSearch.new("foobar@example.com").users.should eq([user])
    UserSearch.new("foobar2").users.should_not eq([user])
  end
end
