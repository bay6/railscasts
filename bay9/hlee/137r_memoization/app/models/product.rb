class Product < ActiveRecord::Base
  def filesize
    sleep 0.5
    4815162342
  end
end
