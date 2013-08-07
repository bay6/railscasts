class BooksController < ApplicationController
  respond_to :html,:json

  def index
    respond_with Book.all
  end

  def show
    respond_with Book.find(params[:id])
  end

  def create
    respond_with Book.create(params_book)
  end

  def update
    respond_with Book.update(params[:id],params_book)
  end

  private
  def params_book
    params.require(:book).permit(:id,:name, :pic, :borrower, :borrowed, :created_at, :updated_at)
  end
end
