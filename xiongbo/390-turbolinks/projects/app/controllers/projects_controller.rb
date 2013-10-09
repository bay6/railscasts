class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.create!(params[:project])
    redirect_to projects_url, notice: "Project was successfully created."
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    @project.update_attributes!(params[:project])
    redirect_to projects_url, notice: "Project was successfully updated."
  end

  def destroy
    Project.destroy(params[:id])
    redirect_to projects_url, notice: "Project was successfully destroyed."
  end
end
