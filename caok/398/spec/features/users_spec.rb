require 'spec_helper'

describe "Users" do
  it "searches users" do
    create(:user, username: "chunky")
    create(:user, username: "bacon")
    visit users_path
    page.should have_content("chunky")
    page.should have_content("bacon")
    fill_in "query", with: "Bacon"
    click_button "Search"
    page.should have_content("bacon")
    page.should_not have_content("chunky")
  end

  it "provides users in CSV" do
    visit users_path
    click_on "Download as CSV"
    page.should have_content("username,email")
  end

  it "creates a new user record" do
    visit new_user_path
    click_button "Sign Up"
    page.should have_content("Form is invalid")
    fill_in "Username", with: "Foobar"
    fill_in "Email", with: "foo@example.com"
    fill_in "user_password", with: "secret"
    fill_in "user_password_confirmation", with: "secret"
    click_button "Sign Up"
    page.should have_content("Thank you for signing up")
  end
end
