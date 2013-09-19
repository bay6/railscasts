class PagesController < ApplicationController
  before_filter :find_page, only: [:show, :edit, :update, :destroy]

  def index
    @pages = Page.all
  end

  def show
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(params[:page])
    if @page.save
      redirect_to @page, notice: "Page was successfully created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @page.update_attributes(params[:page])
      redirect_to @page, notice: "Page was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @page.destroy
    redirect_to pages_url
  end

private
  def find_page
    @page = Page.find_by_slug(params[:id].split('/').last)
  end
end
