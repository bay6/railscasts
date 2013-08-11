require 'active_support/concern'

module TeamCache
  extend ActiveSupport::Concern

  included do
    after_commit :flush_cache

    def flush_cache
      Rails.cache.delete("all_team")
    end

  end

  def cache_users
    Rails.cache.fetch([self, "users"]) { self.users.to_a }
  end

  module ClassMethods
    def cache_all
      Rails.cache.fetch("all_team") { Team.all.to_a }
    end

    def cache_find id
      Rails.cache.fetch([name, id]) { self.find(id) }
    end
  end
end
