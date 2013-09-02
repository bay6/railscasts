# == Schema Information
#
# Table name: recipes
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  image_url   :string(255)
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Recipe < ActiveRecord::Base
  attr_accessible :description, :image_url, :name

  belongs_to :user
  has_many :comments, dependent: :destroy
end
