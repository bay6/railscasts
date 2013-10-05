require 'spec_helper'

describe Order do
  it "is open after purchasing" do
    order = Order.create!
    order.should_not be_open
    order.purchase
    order.should be_open
  end

  it "is not open after invalid purchase" do
    order = Order.create!
    order.invalid_payment = true
    order.purchase
    order.should_not be_open
  end

  it "is closed after canceling" do
    order = Order.create!
    order.purchase
    order.cancel
    order.should_not be_open
  end

  it "is open after resuming" do
    order = Order.create!
    order.purchase
    order.cancel
    order.resume
    order.should be_open
  end

  it "is closed after shipping" do
    order = Order.create!
    order.purchase
    order.ship
    order.should_not be_open
  end

  it "queries open orders" do
    incomplete = Order.create!
    open = Order.create!
    open.purchase
    canceled = Order.create!
    canceled.purchase
    canceled.cancel
    shipped = Order.create!
    shipped.purchase
    shipped.ship
    Order.open_orders.should eq([open])
  end
end
