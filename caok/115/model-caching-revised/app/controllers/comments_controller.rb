class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.build(comment_params)
    if @comment.save
      redirect_to @article, notice: "Added comment."
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:name, :content)
    end
end
