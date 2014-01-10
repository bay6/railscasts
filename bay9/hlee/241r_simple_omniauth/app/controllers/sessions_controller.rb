class SessionsController < ApplicationController
  def create
   binding.pry
   raise env['omniauth.auth'].to_yaml
  end
end
