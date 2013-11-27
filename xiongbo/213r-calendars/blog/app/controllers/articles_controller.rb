class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    @articles_by_date = @articles.group_by(&:published_on)
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params[:article])
    if @article.save
      redirect_to @article, notice: "Created article."
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
