class ArticlesController < ApplicationController
  def index
    @articles = Article.cached_published
  end

  def show
    @article = Article.cached_find(params[:id])
    @comment = Comment.new
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params[:article])
    if @article.save
      redirect_to articles_url, notice: "Created article."
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(params[:article])
      redirect_to @article, notice: "Updated article."
    else
      render :edit
    end
  end
end
