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
    @topic = Topic.new(topic_params)
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
    if @topic.update_attributes(permitted_params.topic)
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

  private
  private
  def topic_params
    if current_user && current_user.admin?
      params.require(:topic).permit!
    else
      params.require(:topic).permit(:name)
    end
  end
end

