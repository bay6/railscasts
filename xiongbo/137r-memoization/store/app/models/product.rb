class Product < ActiveRecord::Base
  def self.memoize name
    alias_method "_unmemoized_#{name}", name
    define_method(name) do |*args|
      @_memoized ||= {}
      @_memoized[name] ||= Hash.new do |hash, key|
        hash[key] = send("_unmemoized_#{name}", *key)
      end
      @_memoized[name][args]
    end
  end

  def filesize(num = 1)
    sleep 0.5
    4823232 * num
  end

  memoize :filesize
end
