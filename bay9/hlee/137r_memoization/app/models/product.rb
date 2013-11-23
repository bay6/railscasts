class Product < ActiveRecord::Base
  def filesize
    @filesize ||= begin
      sleep 0.5
      4815162342
    end
  end
end
