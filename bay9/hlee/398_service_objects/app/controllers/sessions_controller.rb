class SessionsController < ApplicationController
  def new
  end

  def create
    auth = Authentication.new(params, env['omniauth.auth'])
    if auth.authenticated?
      session[:user_id] = auth.user.id
      redirect_to root_url, notice: 'Logged in!'
    else
      flash.now.alert = 'Username or passord is invalid'
      render 'new'
    end
    #if auth = env['omniauth.auth']
    #@user = User.where(auth.slice(:provider, :uid)).first_or_initialize.tap do |usr|
      #usr.provider = auth[:provider]
      #usr.uid = auth[:uid]
      #usr.username = auth[:info][:nickname]
      #usr.save!
    #end
    #else
      #user = User.find_by_username(params[:username])
      #@user = user if user and user.authenticate(params[:username], params[:password])
    #end


    #if env["omniauth.auth"]
      #@user = User.from_omniauth(env["omniauth.auth"])
    #else
      #@user = User.authenticate(params[:username], params[:password])
    #end
    #if @user
      #session[:user_id] = @user.id
      #redirect_to root_url, notice: "Logged in!"
    #else
      #flash.now.alert = "Username or password is invalid"
      #render "new"
    #end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
end
