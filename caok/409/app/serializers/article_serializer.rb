class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :name, :content, :url

  def url
    article_url(object)
  end
end
