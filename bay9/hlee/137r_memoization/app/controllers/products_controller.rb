class ProductsController < ApplicationController
  def show
    @product = Product.first_or_create!
  end
end
