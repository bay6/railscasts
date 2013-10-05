class OrderEvent < ActiveRecord::Base
  belongs_to :order
  attr_accessible :state

  validates_presence_of :order_id
  validates_inclusion_of :state, in: Order::STATES

  def self.with_last_state state
    order("id desc").group("order_id").having(state: state)
  end
end
