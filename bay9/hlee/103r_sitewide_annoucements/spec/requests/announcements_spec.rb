require 'spec_helper'

describe Announcement do
  it "has current scope", focus: true do
    past = Announcement.create! starts_at: 1.day.ago, ends_at: 1.hour.ago
    current = Announcement.create! starts_at: 1.hour.ago, ends_at: 1.day.from_now
    upcoming = Announcement.create! starts_at: 1.hour.from_now, ends_at: 1.day.from_now
    Announcement.current.should eq([current])
  end
end
