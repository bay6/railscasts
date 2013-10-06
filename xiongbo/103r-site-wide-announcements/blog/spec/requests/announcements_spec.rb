require 'spec_helper'

describe "Announcements" do
  it "displays active announcements" do
    Announcements.create! message: "hello world",
                          starts_at: 1.hour.ago, ends_at: 1.hour.from_now
    visit root_path
    page.should have_content "hello world"
  end
end
