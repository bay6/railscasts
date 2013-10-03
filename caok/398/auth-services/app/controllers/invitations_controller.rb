class InvitationsController < ApplicationController
  def new
  end

  def create
    invitation = Invitation.new(current_user)
    if invitation.at_limit?
      flash.now.alert = "You have reached your invitation limit."
      render :new
    else
      invitation.deliver(params[:email])
      redirect_to root_url, notice: "Sent invitation"
    end
  end
end
