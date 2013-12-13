require 'celluloid'

class Rocket
  include Celluloid
  
  def initialize(autolaunch = false)
    launch! if autolaunch
  end

  def launch
    3.downto(1) do |n|
      puts "#{n}..."
      sleep 1
      raise "Houston, we have a problem" if [true, false].sample
    end
    puts "Blast off!"
  end
end

class Launcher
  include Celluloid
  trap_exit :relaunch

  def launch_rocket
    Rocket.new_link.launch!
  end
  
  def relaunch(actor, reason)
    launch_rocket
  end
end
