class UserSearch
  def initialize(query)
    @query = query
  end

  def users
    users = User.order('username')
    if @query.present?
      users = users.where("email like :query or username like :query", query: @query, )
    end
    users
  end
end
