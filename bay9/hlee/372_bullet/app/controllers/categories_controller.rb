class CategoriesController < ApplicationController
  def index
    @categories = Category.order(:name).includes(:products)
  end
end
