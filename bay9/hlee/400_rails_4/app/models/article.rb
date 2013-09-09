class Article < ActiveRecord::Base
  scope :sorted, -> { order(:name) }
end
