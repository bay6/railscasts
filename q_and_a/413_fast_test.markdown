#### Q1 what's `bundle binstubs` 

    to create a binstub for the rspec-core
    
#### Q2 delegate vs decouple

技术实现角度，说说。 

* delegate的用法
* delegate的好处
* delegate的源码实现
* 

#### Q3 empty? present?

```ruby
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
    if timecode && !timecode.present? #empty?
      min, sec = *timecode.split(':').map(&:to_i)
      @seconds = min*60 + sec
    end
  end

  def minutes
    (seconds/60.0).round if seconds
  end
end
```
