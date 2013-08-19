class EpisodesController < ApplicationController
  def index
    @episodes = Episode.published
  end

  def show
    @episode = Episode.find(params[:id])
  end

  def new
    @episode = Episode.new
  end

  def edit
    @episode = Episode.find(params[:id])
  end

  def create
    @episode = Episode.new(params[:episode])
    if @episode.save
      redirect_to @episode, notice: 'Episode was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @episode = Episode.find(params[:id])
    if @episode.update_attributes(params[:episode])
      redirect_to @episode, notice: 'Episode was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @episode = Episode.find(params[:id])
    @episode.destroy
    redirect_to episodes_url, notice: 'Episode was successfully destroyed.'
  end
end
