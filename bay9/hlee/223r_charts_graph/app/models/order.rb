class Order < ActiveRecord::Base
  attr_accessible :price, :purchased_at, :shipping
  def self.total_grouped_by_day(start)
    orders = where(purchased_at: start.beginning_of_day..Time.zone.now)
    orders = orders.group("date(purchased_at)")
    orders = orders.select("purchased_at, sum(price) as total_price")
    orders.group_by { |o| o.purchased_at.to_date }
  end
end
