class ProductsController < ApplicationController
  def index
    @products = Product.all
    expires_in 5.minutes, public: true
  end

  def show
    @product = Product.find(params[:id])
  end
end
