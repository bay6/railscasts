class CommentsController < ApplicationController
  def index
    @commentable = Article.find(params[:article_id])
    @comments = @commentable.comments
  end

  def new
  end
end
