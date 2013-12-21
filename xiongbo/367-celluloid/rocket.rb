require 'celluloid'

class Rocket
  include Celluloid

  def initialize(autolaunch = false)
    async.launch if autolaunch
  end

  def launch
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
  trap_exit :relaunch

  def launch_rocket
    Rocket.new_link.async.launch
  end

  def relaunch(actor, reason)
    launch_rocket
  end
end
