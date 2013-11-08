module OrdersHelper
  def orders_chart_data(start = 3.weeks.ago)
    orders_by_day = Order.total_grouped_by_day(start)
    shipping_by_day = Order.where(shipping: true).total_grouped_by_day(start)
    download_by_day = Order.where(shipping: false).total_grouped_by_day(start)
    (start.to_date..Date.today).map do |date|
      {
        purchased_at: date,
        price: orders_by_day[date].first.try(:total_price) || 0,
        shipping_price: shipping_by_day[date].first.try(:total_price) || 0,
        download_price: download_by_day[date].first.try(:total_price) || 0
      }
    end
  end
end
