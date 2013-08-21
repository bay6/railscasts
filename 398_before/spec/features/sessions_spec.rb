require 'spec_helper'

describe "Sessions" do
  it "logs in user with valid username and password" do
    user = create(:user)
    visit login_path
    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    click_button "Log In"
    page.should have_content("Logged in")
  end

  it "does not log in user with invalid password" do
    user = create(:user)
    visit login_path
    fill_in "Username", with: user.username
    fill_in "Password", with: "incorrect"
    click_button "Log In"
    page.should have_content("Username or password is invalid")
  end

  # it "signs in through Twitter" do
  #   user = create(:user, provider: "twitter", uid: "abc123")
  #   OmniAuth.config.add_mock(:twitter, "uid" => user.uid)
  #   visit login_path
  #   click_on "Sign in with Twitter"
  #   page.should have_content("Logged in")
  # end
end
