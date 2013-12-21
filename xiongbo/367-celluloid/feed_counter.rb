require 'rss'
require 'open-uri'
require 'celluloid'


class FeedCounter
  include Celluloid

  def initialize(url)
    @url = url
  end


  def count
    open(@url) do |f|
      rss = RSS::Parser.parse(f.read, false)
      count = rss.items.size
      puts "#{count} in #{@url}"
      count
    end
  end
end

futures = $*.map { |url| FeedCounter.new(url).future.count }
total = futures.map(&:value).inject(:+)
puts "#{total} total" if total
