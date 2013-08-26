class ArticlesController < ApplicationController
  respond_to :html, :json
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    respond_to do |format|
      format.html { @article }
      format.json  { render json: @article }
    end
  end

  def default_serializer_options
    { root: false }
  end
end
