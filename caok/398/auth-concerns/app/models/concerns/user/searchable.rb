class User
  module Searchable
    extend ActiveSupport::Concern

    module ClassMethods
      def search(query)
        users = order("username")
        if query.present?
          users = users.where("email like :q or username like :q", q: query)
        end
        users
      end
    end
  end
end
