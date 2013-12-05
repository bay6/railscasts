class PermittedParams < Struct.new(:params, :user) 
  def topic
    params.require(:topic).permit(*topic_attribute)
  end

  def topic_attribute
    if user && user.admin?
      [:name, :sticky]
    else
      [:name]
    end
  end
end
