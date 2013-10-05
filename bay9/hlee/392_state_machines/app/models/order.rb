class Order < ActiveRecord::Base
  include Workflow

  scope :open_orders, -> { where(workflow_state: "open") }

  workflow do
    state :incomplete do
      event :purchase, transition_to: :open
    end
    state :open do
      event :cancel, transition_to: :canceled
      event :ship, transition_to: :shipped
    end
    state :canceled do
      event :resume, transition_to: :open
    end
    state :shipped
  end

  def purchase(valid_payment = true)
    # process purchase ...
    halt unless valid_payment
  end
end
