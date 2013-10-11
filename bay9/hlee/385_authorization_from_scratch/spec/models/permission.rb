class Permission < Struct.new(:user)
  def allow?
    user && user.admin?
  end
end
