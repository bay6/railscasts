class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    FNORD_METRIC.event(@product.attributes.merge(_type: :view_product))
  end
end
