class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :name, :content, :url
  has_many :comments
  embed :ids, include: true
  delegate :current_user, to: :scope

  def url
    article_url(object)
  end

  def attributes
    data = super
    data[:edit_url] = edit_article_url(object) if current_user.admin?
    data
  end
end
