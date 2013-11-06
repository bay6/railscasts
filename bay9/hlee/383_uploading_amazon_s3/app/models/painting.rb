class Painting < ActiveRecord::Base
  attr_accessible :image, :name
  mount_uploader :image, ImageUploader

  def image_name
    File.basename(image.path || image.filename) if image 
  end
end
