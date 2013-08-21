module Authentication
  extend ActiveSupport::Concern
  included do
    has_secure_password
  end

  module ClassMethods
    def authenticate(username, password)
      usr = find_by_username(username)
      usr if usr and usr.authenticate(password)
    end
  end
end
