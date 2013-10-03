require 'spec_helper'

describe "Orders" do
  it "validates card number", js: true do
    visit new_order_path
    fill_in "Credit Card Number", with: "1234"
    page.should have_content("Invalid card number")
  end
end
