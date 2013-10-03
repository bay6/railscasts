require 'spec_helper'

describe Authentication do
  describe '#authenticated?' do
    it "if username and password match" do
      create(:user, username: "foobar", password: "secret")
      Authentication.new(username: "foobar", password: "secret").should be_authenticated
      Authentication.new(username: "foobar", password: "a").should_not be_authenticated
      Authentication.new(username: "a", password: "secret").should_not be_authenticated
    end

    it "if omniauth" do
      create(:user, username: "foobar", password: "secret")
      Authentication.new(nil, {provider: "foo", uid: "123", info: {nickname: "newfoo"}}).should be_authenticated
    end
  end

  describe '#user' do
    it "matches username" do
      user = create(:user, username: "foobar", password: "secret")
      Authentication.new(username: "foobar", password: "secret").user.should eq(user)
    end

    it "matches omniauth details" do
      user = create(:user, provider: "foo", uid: "123", username: "foobar")
      omniauth = {provider: "foo", uid: "123", info: {nickname: "newfoo"}}
      Authentication.new(nil, omniauth).user.should eq(user)
      Authentication.new(nil, omniauth).user.username.should eq("newfoo")
    end
  end
end
