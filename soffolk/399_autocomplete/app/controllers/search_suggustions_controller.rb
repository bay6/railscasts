class SearchSuggustionsController < ApplicationController

  def index
    render json: SearchSuggustion.term_for(params[:term])
  end
end
