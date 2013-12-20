require 'celluloid'

class Rocket
  include Celluloid

  def lanuch
    raise "Wuhan, we have a problem"
    3.downto(1) do |n|
      puts "#{n}......"
      sleep 1
    end

    puts "blast off!!!!"
  end
end


class Launcher
  include Celluloid

  def launch_rocket
    Rocket.new_link.async.lanuch
  end
end
