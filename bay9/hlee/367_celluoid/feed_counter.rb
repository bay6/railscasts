require 'rss'
require 'open-uri'
require 'celluloid'

class FeedCounter
  include Celluloid
  
  def count(url)
    open(url) do |f|
      rss = RSS::Parser.parse(f.read, false)
      count = rss.items.size
      puts "#{count} in #{url}"
      count
    end
  end
end

pool = FeedCounter.pool(size: 6)
futures = $*.map { |url| pool.future(:count, url) }
total = futures.map(&:value).inject(:+)
puts "#{total} total" if total
