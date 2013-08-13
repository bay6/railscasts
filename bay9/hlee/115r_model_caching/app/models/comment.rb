class Comment < ActiveRecord::Base
  belongs_to :article, touch: true
  attr_accessible :name, :content
end
