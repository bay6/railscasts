class Order < ActiveRecord::Base
  attr_accessor :card_number, :card_expires_on
  attr_accessible :card_number, :card_expires_on
end
