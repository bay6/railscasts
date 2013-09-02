# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  content    :text
#  user_id    :integer
#  recipe_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Comment < ActiveRecord::Base
  attr_accessible :content

  belongs_to :user
  belongs_to :recipe
end
