require 'celluloid'

class Rocket
  include Celluloid

  def lanuch
    3.downto(1) do |n|
      puts "#{n}......"
      sleep 1
      raise "Wuhan, we have a problem" if [true, false].sample
    end

    puts "blast off!!!!"
  end
end


class Launcher
  include Celluloid
  trap_exit :recover

  def launch_rocket
    Rocket.new_link.async.lanuch
  end

  def recover(actor, reason)
    puts "Recoverying"
  end
end
