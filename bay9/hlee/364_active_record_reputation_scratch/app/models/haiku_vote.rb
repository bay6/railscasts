class HaikuVote < ActiveRecord::Base
  attr_accessible :haiku_id, :value
end
