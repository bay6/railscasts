class Product < ActiveRecord::Base
  def filesize
    @filesize = calculate_filesize unless defined? @filesize
    @filesize
  end

  def calculate_filesize
    sleep 0.5
    4815162342
    false
  end
end
