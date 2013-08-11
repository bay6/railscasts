class User < ActiveRecord::Base
  include UserCache

  has_many :created_missions, class_name: "Mission", foreign_key: "creator_id"
  has_many :assigned_missions, class_name: "Mission", foreign_key: "assigned_to_id"
  has_and_belongs_to_many :teams

  has_many :events

  class << self
    def find_or_create_from_auth_hash auth_hash
      @user = self.where(uid: auth_hash.uid, provider: :github).
        first_or_create(email: auth_hash.info.email,
                        github_homepage: auth_hash.info.urls.GitHub,
                        nickname: auth_hash.info.nickname)
    end
  end

  def admin?
    Setting.admin_emails.include? email.downcase
  end

  def avatar_url
    avatar_id = Digest::MD5::hexdigest(email.downcase)
    @avatar_url ||= "http://gravatar.com/avatar/#{avatar_id}.png?s=100"
  end

end
