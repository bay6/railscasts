class GuestsController < ApplicationController
  def create
    guest = User.create! { |u| u.profile = GuestProfile.create! }
    session[:user_id] = guest.id
    redirect_to root_url
  end
end
