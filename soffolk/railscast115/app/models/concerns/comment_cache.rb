require 'active_support/concern'
module CommentCache
  extend ActiveSupport::Concern

  def cache_user
    User.cache_find self.user_id
  end
end
