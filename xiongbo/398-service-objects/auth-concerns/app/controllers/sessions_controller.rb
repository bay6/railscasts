class SessionsController < ApplicationController
  def new
  end

  def create
    if env["omniauth.auth"]
      @user = User.from_omniauth(env["omniauth.auth"])
    else
      @user = User.authenticate(params[:username], params[:password])
    end
    if @user
      session[:user_id] = @user.id
      redirect_to root_url, notice: "Logged in!"
    else
      flash.now.alert = "Username or password is invalid"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
end
