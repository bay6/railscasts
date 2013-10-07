require 'spec_helper'

describe "Announcements" do
  describe "GET /announcements" do
    it "displays active announcements" do
      Announcement.create! message: "Hello World", starts_at: 1.hour.ago, ends_at: 1.hour.from_now
      visit root_path
      page.should have_content("Hello World")
    end
  end
end
