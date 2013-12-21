require 'rss'
require 'open-uri'


class FeedCounter
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

counts = $*.map { |url| FeedCounter.new(url).count }
total = counts.inject(:+)
puts "#{total} total" if total
