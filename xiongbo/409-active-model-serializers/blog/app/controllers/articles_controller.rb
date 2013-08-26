class ArticlesController < ApplicationController
  respond_to :html, :json
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    respond_with @article
  end
end
