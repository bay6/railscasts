require 'spec_helper'

describe TimeDuration do
  it "translates single digit seconds into timecode with minutes" do
    build(:episode, seconds: 60*8+3).timecode.should eq('8:03')
  end

  it "translates double digit seconds into timecode with minutes" do
    build(:episode, seconds: 60*8+12).timecode.should eq('8:12')
  end

  it "returns nil for timecode if seconds aren't set" do
    build(:episode, seconds: nil).timecode.should be_nil
  end

  it "parses timecode into seconds" do
    build(:episode, timecode: '10:03').seconds.should eq(603)

    build(:episode, timecode: '').seconds.should be_nil
  end

  it "returns nil for minutes if seconds aren't set" do
    build(:episode, seconds: nil).minutes.should be_nil
  end

  it "rounds the number of minutes" do
    build(:episode, seconds: 60).minutes.should eq(1)
    build(:episode, seconds: 91).minutes.should eq(2)
  end
  
end
