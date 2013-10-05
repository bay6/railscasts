class Orders < ActiveRecord::Base
  include AASM

  scope :open_orders, -> { where(aasm_state: "open") }
  attr_accessor :invalid_payment

  aasm do
    state :incomplete, initial: true
    state :open
    state :canceled
    state :shipped

    event :purchase, before: :process_purchase do
      transitions from: :incomplete, to: :open, guard: :valid_payment?
    end

    event :cancel do
      transitions from: :open, to: :canceled
    end

    event :resume do
      transitions from: :canceled, to: :open
    end

    event :ship do
      transitions from: :open, to: :shipped
    end
  end

  def process_purchase
    # process order ...
  end

  def valid_payment?
    !invalid_payment
  end
end
