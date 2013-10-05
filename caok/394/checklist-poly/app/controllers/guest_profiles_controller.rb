class GuestProfilesController < ApplicationController
  def create
    user = User.create! {|u| u.profile = GuestProfile.create! }
    session[:user_id] = user.id
    redirect_to root_url
  end
end
