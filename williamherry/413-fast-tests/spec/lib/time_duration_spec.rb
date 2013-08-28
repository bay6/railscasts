require "time_duration"

describe TimeDuration do
  it "translates single digit seconds into timecode with minutes" do
    TimeDuration.new(60*8+3).timecode.should eq('8:03')
  end

  it "translates double digit seconds into timecode with minutes" do
    TimeDuration.new(60*8+12).timecode.should eq('8:12')
  end

  it "returns nil for timecode if seconds aren't set" do
    TimeDuration.new(nil).timecode.should be_nil
  end

  it "parses timecode into seconds" do
    duration = TimeDuration.new(nil)
    duration.timecode = "10:03"
    duration.seconds.should eq(603)
    duration = TimeDuration.new(nil)
    duration.timecode = ""
    duration.seconds.should be_nil
  end

  it "returns nil for minutes if seconds aren't set" do
    TimeDuration.new(nil).minutes.should be_nil
  end

  it "rounds the number of minutes" do
    TimeDuration.new(60).minutes.should eq(1)
    TimeDuration.new(91).minutes.should eq(2)
  end
end
