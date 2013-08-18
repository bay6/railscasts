class TimeDuration
  attr_accessor :seconds

  def initialize(seconds)
    @seconds = seconds
  end

  def timecode
    if @seconds
      min, sec = *seconds.divmod(60)
      [min, sec.to_s.rjust(2, '0')].join(':')
    end
  end

  def timecode=(timecode)
    if timecode && !timecode.present?
      min, sec = *timecode.split(':').map(&:to_i)
      @seconds = min*60 + sec
    end
  end

  def minutes
    (seconds/60.0).round if seconds
  end
end
