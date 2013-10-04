require 'spec_helper'

describe Announcement do
  it "has current scope", focus: true do
    past = Announcement.create! starts_at: 1.day.ago, ends_at: 1.hour.ago
    current = Announcement.create! starts_at: 1.hour.ago, ends_at: 1.day.from_now
    upcoming = Announcement.create! starts_at: 1.hour.from_now, ends_at: 1.day.from_now
    Announcement.current.should eq([current])
  end


  it "displays active announcements" do
    Announcement.create! message: "Hello World", starts_at: 1.hour.ago, ends_at: 1.hour.from_now
    Announcement.create! message: "Upcoming", starts_at: 10.minutes.from_now, ends_at: 1.hour.from_now
    visit root_path
    page.should have_content "Hello World"
    page.should_not have_content "Upcoming"
    click_on "hide announcement"
    page.should_not have_content "Hello World"
  end

  it "does not include ids passed in to current" do
    current1 = Announcement.create! starts_at: 1.hour.ago, ends_at: 1.day.from_now
    current2 = Announcement.create! starts_at: 1.hour.ago, ends_at: 1.day.from_now
    Announcement.current([current2.id]).should eq([current1])
  end

  it "includes current when nil is passed in" do
    current = Announcement.create! starts_at: 1.hour.ago, ends_at: 1.day.from_now
    Announcement.current(nil).should eq([current])
  end  
end
