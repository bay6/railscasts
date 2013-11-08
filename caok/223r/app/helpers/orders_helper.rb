module OrdersHelper
  def orders_chart_data
    (3.weeks.ago.to_date..Date.today).map do |date|
      {
        purchased_at: date,
        price: Order.where("date(purchased_at) = ?", date).sum(:price)
      }
    end
  end
end
