class TasksController < ApplicationController
  def create
    @project = Project.find(params[:project_id])
    @project.tasks.create!(params[:task])
    redirect_to @project, notice: "Task was successfully added."
  end
end
