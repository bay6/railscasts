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

  def discontinue 
    Product.update_all({discontinued: true}, {id: params[:product_ids]})
    redirect_to products_url
  end

  def edit_multiple 
    @products = Product.find(params[:product_ids])
  end

  def update_multiple
    #@products = Product.update(params[:products].keys, params[:products].values)
    #@products.reject! { |p| p.errors.empty? }
    @products = Product.find(params[:product_ids])
    @products.reject! do |product|
      product.update_attributes(params[:product].reject{ |k,v| v.blank? })
    end
    if @products.empty?
      redirect_to products_path
    else
      @product = Product.new(params[:product])
      render 'edit_multiple'
    end
  end
end
