class Order < ActiveRecord::Base
  attr_accessible :purchased_at, :shipped_at, :canceled_at
  attr_accessor :invalid_payment

  def self.open_orders
    where('purchased_at is not null and canceled_at is null and shipped_at is null')
  end

  def open?
    purchased_at && !canceled_at && !shipped_at
  end

  def purchase
    # process payment ...
    update_attributes(purchased_at: Time.zone.now) unless invalid_payment
  end

  def ship
    update_attributes(shipped_at: Time.zone.now)
  end

  def cancel
    update_attributes(canceled_at: Time.zone.now)
  end

  def resume
    update_attributes(canceled_at: nil)
  end
end
