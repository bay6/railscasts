require 'time_duration'

describe TimeDuration do
  it "translates single digit seconds into timecode with minutes" do
    TimeDuration.new(60*8+3).timecode.should eq('8:03')
  end
end
