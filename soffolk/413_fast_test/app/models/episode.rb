class Episode < ActiveRecord::Base
  attr_accessible :description, :name, :seconds, :published_on, :timecode
  validates_presence_of :name, :description
  scope :published, lambda { where('published_on <= ?', Time.now.to_date) }
  delegate :timecode, :minutes, to: :duration

  def duration
    @duration ||= TimeDuration.new(seconds)
  end

  def timecode=(timecode)
    duration.timecode = timecode
    self.seconds = duration.seconds
  end
end
