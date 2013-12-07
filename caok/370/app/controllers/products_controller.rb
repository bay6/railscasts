class ProductsController < ApplicationController
  def index
    @search = Product.search(params[:q])
    @products = @search.result
    @search.build_condition
    @search.build_sort if @search.sorts.empty?
  end
end
