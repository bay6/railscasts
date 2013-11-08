module OrdersHelper
  def orders_chart_data
    orders_by_day = Order.total_grouped_by_day(3.weeks.ago)
    (3.weeks.ago.to_date..Date.today).map do |date|
      {
        purchased_at: date,
        price: orders_by_day[date].first.try(:total_price) || 0
      }
    end
  end
end
