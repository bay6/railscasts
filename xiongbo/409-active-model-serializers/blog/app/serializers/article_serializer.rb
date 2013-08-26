class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :name, :content, :url
  has_many :comments

  def url
    article_url(object)
  end
end
