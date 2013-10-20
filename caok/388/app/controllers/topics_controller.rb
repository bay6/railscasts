class TopicsController < ApplicationController
  def index
    @topics = current_tenant.topics
  end

  def show
    @topic = current_tenant.topicsfind(params[:id])
  end

  def new
    @topic = current_tenant.topicsnew
  end

  def create
    @topic = current_tenant.topicsnew(params[:topic])
    @topic.user = current_user
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
    if @topic.update_attributes(params[:topic])
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
