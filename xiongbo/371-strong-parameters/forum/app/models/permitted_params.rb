class PermittedParams < Struct.new(:params, :user) 
  def topic
    if user && user.admin?
      params.require(:topic).permit!
    else
      params.require(:topic).permit(:name)
    end
  end
end
