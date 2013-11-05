class OrdersController < ApplicationController
  def index
    @orders = Order.order("purchased_at desc").page(params[:page]).per_page(10)
  end
end
