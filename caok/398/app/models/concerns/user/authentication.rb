class User
  module Authentication
    extend ActiveSupport::Concern

    included do
      has_secure_password
    end

    module ClassMethods
      def authenticate(username, password)
        user = find_by_username(username)
        user if user && user.authenticate(password)
      end

      def from_omniauth(auth)
        where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
          user.provider = auth[:provider]
          user.uid = auth[:uid]
          user.username = auth[:info][:nickname]
          user.save!
        end
      end
    end
  end
end
