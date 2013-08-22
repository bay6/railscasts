class TimeDuration
  attr_reader :seconds, :timecode, :minutes
  def initialize(seconds)
    @seconds = seconds
    @minutes = (seconds/60.0).round if seconds
  end

  def timecode
    if seconds
      min, sec = *seconds.divmod(60)
      [min, sec.to_s.rjust(2, '0')].join(':')
    end
  end

  def timecode= timecode
    if timecode.present?
      @minutes, @seconds = *timecode.split(':').map(&:to_i)
      @seconds = @minutes*60 + @seconds
    end
  end

end
