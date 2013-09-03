class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(params[:product])
    if @product.save
      redirect_to products_url, notice: 'Product was successfully created.'
    else
      render "new"
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(params[:product])
      redirect_to products_url, notice: 'Product was successfully updated.'
    else
      render "edit"
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_url, notice: "Product was successfully destroyed."
  end

  def edit_multipul
    @products = Product.find(params[:product_ids])
  end

  def update_multipul
    @products = Product.update(params[:products].keys, params[:products].values)
    @products.reject!{ |product| product.errors.empty? }
    if @products.empty?
      redirect_to products_path
    else
      render "edit_multipul"
    end
  end
end
