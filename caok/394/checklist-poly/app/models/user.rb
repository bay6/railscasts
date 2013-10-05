class User < ActiveRecord::Base
  has_many :tasks, dependent: :destroy

end
