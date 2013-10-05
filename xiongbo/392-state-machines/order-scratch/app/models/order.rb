class Order < ActiveRecord::Base
  has_many :events, class_name: "OrderEvent"

  STATES = %w(incomplete open canceled shipped)
  delegate :incomplete?, :open?, :canceled?, :shipped?, to: :current_state 

  def self.open_orders
    joins(:events).merge OrderEvent.with_last_state("open")
  end 

  def current_state
    (events.last.try(:state) || STATES.first).inquiry
  end 

  def purchase valid_payment = true
    if incomplete?
      events.create! state: "open" if valid_payment
    end
  end

  def cancel
    events.create! state: "canceled" if open?
  end

  def resume
    events.create! state: "open" if canceled?
  end

  def ship
    events.create! state: "shipped" if open?
  end
end
