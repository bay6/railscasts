class CommentsController < ApplicationController
  before_filter :require_login
  before_filter :load_recipe

  def create
    @comment = @recipe.comments.build(params[:comment])
    @comment.user = current_user
    if @comment.save
      redirect_to @recipe, notice: "Comment was created."
    else
      render :new
    end
  end

  def edit
    @comment = current_user.comments.find(params[:id])
  end

  def update
    @comment = current_user.comments.find(params[:id])
    if @comment.update_attributes(params[:comment])
      redirect_to @recipe, notice: "Comment was updated."
    else
      render :edit
    end
  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    @comment.destroy
    redirect_to @recipe, notice: "Comment was destroyed."
  end

private

  def load_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end
end
