class Product < ActiveRecord::Base
  def filesize
    @filesize ||= calculate_filesize
  end

  def calculate_filesize
    sleep 0.5
    4815162342
  end
end
