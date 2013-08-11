class CommentsController < ApplicationController

  def create
    @mission = Mission.find(params[:mission_id])
    @comment = @mission.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      @mission.events.create(user: current_user, action: "comment")
      render layout: false
    end
  end

  def preview
    @comment = Comment.new(comment_params)

    render layout: false
  end

  private

    def comment_params
      params.require(:comment).permit(:content)
    end

end
