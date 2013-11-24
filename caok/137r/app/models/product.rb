class Product < ActiveRecord::Base
  def filesize(*args)
    @filesize ||= {}
    @filesize[args] ||= calculate_filesize(*args)
  end

private

  def calculate_filesize(num = 1)
    sleep 0.5
    4815162342 * num
  end

  # Alternative approaches
  #
  # def filesize
  #   @filesize = calculate_filesize unless defined? @filesize
  #   @filesize
  # end
  #
  # ---
  #
  # def filesize(*args)
  #   @filesize ||= Hash.new do |hash, key|
  #     hash[key] = calculate_filesize(*key)
  #   end
  #   @filesize[args]
  # end
  # 
  # ---
  #
  # def self.memoize(name)
  #   alias_method "_unmemoized_#{name}", name
  #   define_method(name) do |*args|
  #     @_memoized ||= {}
  #     @_memoized[name] ||= Hash.new do |hash, key|
  #       hash[key] = send("_unmemoized_#{name}", *key)
  #     end
  #     @_memoized[name][args]
  #   end
  # end
  # 
  # def filesize(num = 1)
  #   sleep 0.5
  #   4815162342 * num
  # end
  # memoize :filesize
end
