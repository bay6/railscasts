require 'spec_helper'

describe "Invitations" do
  it "emails recipient when sending invitation" do
    login
    visit new_invitation_path
    fill_in "Email", with: "recipient@example.com"
    click_on "Send Invitation"
    page.should have_content("Sent invitation")
    last_email.to.should include("recipient@example.com")
  end

  it "does not email recipient when reached invitation limit" do
    login(invitation_count: 1000)
    visit new_invitation_path
    fill_in "Email", with: "recipient@example.com"
    click_on "Send Invitation"
    page.should have_content("You have reached your invitation limit")
    last_email.should be_nil
  end
end
