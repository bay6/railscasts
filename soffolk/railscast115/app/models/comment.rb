class Comment < ActiveRecord::Base
  include CommentCache

  belongs_to :commentable, polymorphic: true, touch: true
  belongs_to :user

  validates_presence_of :content

end
