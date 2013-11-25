module CalendarHelper
  def calendar(date = Date.today, &block)
    Calendar.new(self, date, block).table
  end

  class Calendar < Struct.new(:view, :date, :callback)
    HEADER = %w(Sunday Monday Tuesday Wednesday Thursday Friday Saturday)
    START_DAY = :sunday
    
    delegate :content_tag, to: :view
  end
end
