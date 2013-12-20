require 'celluloid'

class Rocket
  include Celluloid

  def lanuch
    3.downto(1) do |n|
      puts "#{n}......"
      sleep 1
    end

    puts "blast off!!!!"
  end
end
