class Haiku < ActiveRecord::Base
  attr_accessible :content, :published_at
  belongs_to :user
  before_create :default_published_at

  def default_published_at
    self.published_at ||= Time.zone.now
  end
end
