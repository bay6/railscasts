class CommentsController < ApplicationController
  before_filter :load_article

  def create
    @comment = @article.comments.build(params[:comment])
    if @comment.save
      redirect_to @article, notice: "Added comment."
    else
      render :new
    end
  end

private

  def load_article
    @article = Article.find(params[:article_id])
  end
end
