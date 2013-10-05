class Order < ActiveRecord::Base
  scope :open_orders, -> { with_state(:open) }
  attr_accessor :invalid_payment

  state_machine initial: :incomplete do
    event :purchase do
      transition :incomplete => :open
    end

    event :cancel do
      transition :open => :canceled
    end

    event :resume do
      transition :canceled => :open
    end

    event :ship do
      transition :open => :shipped
    end

    before_transition :incomplete => :open do |order|
      # process payment ...
      !order.invalid_payment
    end
  end
end

