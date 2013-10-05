class MemberProfilesController < ApplicationController
  def new
    @member_profile = MemberProfile.new
  end

  def create
    @member_profile = MemberProfile.new(params[:member_profile])
    if @member_profile.save
      current_user.move_to(@member_profile) if current_user && current_user.guest?
      session[:user_id] = @member_profile.id
      redirect_to root_url
    else
      render "new"
    end
  end
end
