module CalendarHelper
  def calendar(date = Date.today, &block)
    Calendar.new(self, date, block).table
  end

  class Calendar < Struct.new(:view, :date, :callback)
  end
end
