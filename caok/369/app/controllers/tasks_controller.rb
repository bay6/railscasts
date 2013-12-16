class TasksController < ApplicationController
  def create
    @project = Project.find(params[:project_id])
    @project.tasks.create!(params[:task])
    redirect_to @project
  end

  def update
    @project = Project.find(params[:project_id])
    @task = @project.tasks.find(params[:id])
    @task.update_attributes!(params[:task])
    respond_to do |format|
      format.html { redirect_to @project }
      format.js
    end
  end
end
