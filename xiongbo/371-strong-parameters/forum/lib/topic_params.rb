module TopicParams
  private 
  def topic_params
    if current_user && current_user.admin?
      params.require(:topic).permit!
    else
      params.require(:topic).permit(:name)
    end
  end
end
