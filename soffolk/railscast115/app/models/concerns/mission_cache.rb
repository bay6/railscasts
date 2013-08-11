require 'active_support/concern'
module MissionCache
  extend ActiveSupport::Concern

  included do
    after_commit :flush_cache

    def flush_cache
      Rails.cache.delete("lastest_mission")
      Rails.cache.delete("all_mission")
    end
  end

  def cache_comments_count
    Rails.cache.fetch([self, "comments_count"]) { self.comments.count }
  end

  def cache_comments
    Rails.cache.fetch([self, "comments"]) { self.comments.to_a }
  end

  def cache_creator
    User.cache_find self.creator_id
  end

  def cache_assigned_to
    User.cache_find self.assigned_to_id
  end

  module ClassMethods
    def cache_latest_mission
      Rails.cache.fetch("latest_mission") { self.order("id desc").limit(10).to_a }
    end

    def cache_all
      Rails.cache.fetch("all_mission") { self.all.to_a }
    end

    def cache_find id
      Rails.cache.fetch([name, id]) { self.find(id) }
    end
  end

end
