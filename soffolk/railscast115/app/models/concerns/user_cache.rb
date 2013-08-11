require 'active_support/concern'
module UserCache
  extend ActiveSupport::Concern

  module ClassMethods
    def cache_find(id)
      Rails.cache.fetch([name, id]) { self.find_by_id(id) }
    end
  end
end
