require 'spec_helper'

describe "Announcements" do
  it "displays active announcements with js", js: true  do
    Announcement.create! message: "hello world",
                          starts_at: 1.hour.ago, ends_at: 1.hour.from_now
    Announcement.create! message: "upcoming",
                          starts_at: 10.minutes.from_now,  ends_at: 1.hour.from_now
    visit root_path
    expect(page).to have_content "hello world"
    expect(page).not_to have_content "upcoming"

    expect { click_on "hide announcement" }.to_not change { page.response_headers }
    expect(page).not_to have_content "hello world"
  end

  it "has current scope" do
    past = Announcement.create! starts_at: 1.days.ago, ends_at: 1.hour.ago
    current = Announcement.create! starts_at: 1.hour.ago, ends_at: 1.day.from_now
    upcoming = Announcement.create! starts_at: 1.hour.from_now, ends_at: 1.day.from_now

    Announcement.current.should eq [current]
  end 
end
