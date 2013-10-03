class TasksController < ApplicationController
  def index
    if current_user
      @incomplete_tasks = current_user.tasks.where(complete: false)
      @complete_tasks = current_user.tasks.where(complete: true)
    end
  end

  def create
    @task = current_user.tasks.create!(params[:task])
    redirect_to tasks_url
  end

  def update
    @task = current_user.tasks.find(params[:id])
    @task.update_attributes!(params[:task])
    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.js
    end
  end

  def destroy
    @task = current_user.tasks.find(params[:id])
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.js
    end
  end
end
