class UserFormat
  def initialize(users)
    @users = users
  end

  def csv
    CSV.generate do |csv|
      csv << %w[id username email]
      @users.each do |user|
        csv << [user.id, user.username, user.email]
      end
    end
  end
end
