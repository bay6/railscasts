class ErrorsController < ApplicationController
  def show
    #render text: request.path
    @exeception = env['action_dispatch.exception']
    respond_to do |format|
      format.html { render action: request.path[1..-1] }
      format.json { render json: {status: request.path[1..-1], error: @exception.message} }
    end
  end
end
