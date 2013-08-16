class TasksController < ApplicationController
  respond_to :html, :json

  def index
    @tasks = Task.order("updated_at, id")
    respond_with @tasks
  end

  def show
    respond_with Task.find(params[:id])
  end

  def create
    respond_with Task.create(params[:task])
  end

  def update
    respond_with Task.update(params[:id], params[:task])
  end

  def destroy
    respond_with Task.destroy(params[:id])
  end
end
