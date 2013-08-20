class ApplicationController < ActionController::Base
  protect_from_forgery

  #rescue_from "Exception", with: :forbidden

  #private

  #def forbidden exception
    #render text: exception.message
  #end
end
