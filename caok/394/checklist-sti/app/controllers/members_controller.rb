class MembersController < ApplicationController
  def new
    @member = Member.new
  end

  def create
    @member = Member.new(params[:member])
    if @member.save
      current_user.move_to(@member) if current_user && current_user.guest?
      session[:user_id] = @member.id
      redirect_to root_url
    else
      render "new"
    end
  end
end
