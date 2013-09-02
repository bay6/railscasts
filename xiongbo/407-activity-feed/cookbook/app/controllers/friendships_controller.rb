class FriendshipsController < ApplicationController
  before_filter :require_login

  def create
    @friendship = current_user.friendships.create!(:friend_id => params[:friend_id])
    redirect_to :back, notice: "Added friend."
  end

  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    redirect_to :back, notice: "Removed friendship."
  end
end
