require 'active_support/concern'
module EventCache
  extend ActiveSupport::Concern

  included do
    after_commit :flush_cache

    def flush_cache
      Rails.cache.delete("newest_event")
    end
  end

  def cache_user
    User.cache_find self.user_id
  end

  def cache_eventable
    Rails.cache.fetch([self, "eventable"]) { self.eventable }
  end

  module ClassMethods
    def cache_newest_event
      Rails.cache.fetch(["newest_event"]) { self.order("id desc").limit(15).to_a }
    end
  end
end
