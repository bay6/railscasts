require 'spec_helper'

describe "Orders" do

  it "fetches more orders when scrolling to the bottom", js: true do
    11.times { |n| Order.create! number: n+1 }
    visit orders_path
    page.should have_content('Order #1') 
    page.should_not have_content('Order #16')
    page.evaluate_script("window.scrollTo(0, document.height)")
    page.should_not have_content('Order #16')
  end 

end
