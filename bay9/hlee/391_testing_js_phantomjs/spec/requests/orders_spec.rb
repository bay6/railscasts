require 'spec_helper'

describe "Orders" do
  it "validates card number", js: true do
    visit new_order_path
    fill_in "Credit Card Number", with: "1234"
    page.should have_content("Invalid card number")
  end

  it "fetches more orders when scrolling to the bottom", js: true do
    11.times { |n| Order.create! number: n+1 }
    visit orders_path
    page.should have_content('Order #1')
  end
end
