class TasksController < ApplicationController
  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update_attributes!(params[:task])
    redirect_to projects_url, notice: "Task was successfully updated."
  end
end
