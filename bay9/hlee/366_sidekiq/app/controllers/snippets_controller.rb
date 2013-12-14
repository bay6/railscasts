class SnippetsController < ApplicationController
  def show
    @snippet = Snippet.find(params[:id])
  end

  def new
    @snippet = Snippet.new
  end

  def create
    @snippet = Snippet.new(params[:snippet])
    if @snippet.save
      uri = URI.parse("http://pygments.appspot.com/")
      request = Net::HTTP.post_form(uri, lang: @snippet.language, code: @snippet.plain_code)
      @snippet.update_attribute(:highlighted_code, request.body)
      redirect_to @snippet
    else
      render :new
    end
  end
end
