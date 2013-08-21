class User
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

      def from_omniauth(auth)
        where(auth.slice(:provider, :uid)).first_or_initialize.tap do |usr|
          usr.provider = auth[:provider]
          usr.uid = auth[:uid]
          usr.username = auth[:info][:nickname]
          usr.save!
        end
      end
    end
  end
end
