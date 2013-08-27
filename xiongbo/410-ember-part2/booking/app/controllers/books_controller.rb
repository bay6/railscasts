class BooksController < ApplicationController
  respond_to :json

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
    respond_with Book.update(params_book)
  end

  def destroy
    respond_with Book.destroy(params[:id])
  end

  private
  def params_book
    params.require(:book).permit(:name, :booked)
  end
end
