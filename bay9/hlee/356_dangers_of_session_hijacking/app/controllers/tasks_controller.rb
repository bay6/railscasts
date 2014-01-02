class TasksController < ApplicationController
  before_filter :authorize, only: :create

  def index
  end

  def create
    current_user.tasks.create!(params[:task])
    redirect_to tasks_url
  end

private

  def authorize
    redirect_to login_url, alert: "Not authorized" if current_user.nil?
  end
end
