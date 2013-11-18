class Page < ActiveRecord::Base
  attr_accessible :content, :name, :permalink
end
