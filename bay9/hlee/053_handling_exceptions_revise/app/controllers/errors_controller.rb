class ErrorsController < ApplicationController
  def show
    render text: request.path
  end
end
