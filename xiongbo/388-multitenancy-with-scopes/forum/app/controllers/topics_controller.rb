class TopicsController < ApplicationController
  def index 
    @topics = current_tenant.topics
  end

  def show
    @topic = current_tenant.topics.find(params[:id])
  end

  def new
    @topic = current_tenant.topics.new
  end

  def create
    @topic = Tcurrent_tenant.topics.new(params[:topic])
    @topic.user = current_user
    if @topic.save
      redirect_to @topic, notice: "Created topic."
    else
      render :new
    end
  end

  def edit
    @topic = current_tenant.topics.find(params[:id])
  end

  def update
    @topic = current_tenant.topics.find(params[:id])
    if @topic.update_attributes(params[:topic])
      redirect_to topics_url, notice: "Updated topic."
    else
      render :edit
    end
  end

  def destroy
    @topic = current_tenant.topics.find(params[:id])
    @topic.destroy
    redirect_to topics_url, notice: "Destroyed topic."
  end
end
