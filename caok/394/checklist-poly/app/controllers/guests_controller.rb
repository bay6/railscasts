class GuestsController < ApplicationController
  def create
    guest = Guest.create!
    session[:user_id] = guest.id
    redirect_to root_url
  end
end
