class User < ActiveRecord::Base
  has_many :tasks, dependent: :destroy
  belongs_to :profile, polymorphic: true

  delegate :guest?, :name, :can_share_task?, :send_password_reset,
    :become_member, to: :profile

end
