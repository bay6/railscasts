class InvitationsController < ApplicationController
  def new
  end

  def create
    if current_user.reached_invitation_limit?
      flash.now.alert = "You have reached your invitation limit."
      render :new
    else
      current_user.send_invitation(params[:email])
      redirect_to root_url, notice: "Sent invitation"
    end
  end
end
