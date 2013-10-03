class MembersController < ApplicationController
  def new
    @user = Member.new
  end

  def create
    @user = params[:member] ? Member.new(params[:member]) : Guest.new
    if @user.save
      current_user.move_to(@user) if current_user && current_user.guest?
      session[:user_id] = @user.id
      redirect_to root_url
    else
      render "new"
    end
  end
end
