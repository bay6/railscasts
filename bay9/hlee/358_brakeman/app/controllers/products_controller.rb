class ProductsController < ApplicationController
  def index
    direction = params[:direction] == "desc" ? "desc" : "asc"
    @products = Product.order("name #{direction}")
  end

  def show
    @product = Product.find(params[:id])
  end
end
