class TopicsController < ApplicationController
  def index
    @topics = Topic.order("sticky desc")
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(params[:topic], as: current_user.try(:admin?) ? :admin : :user)
    if @topic.save
      redirect_to @topic, notice: "Created topic."
    else
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])
    if @topic.update_attributes(params[:topic], as: current_user.try(:admin?) ? :admin : :user)
      redirect_to topics_url, notice: "Updated topic."
    else
      render :edit
    end
  end

  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy
    redirect_to topics_url, notice: "Destroyed topic."
  end
end
