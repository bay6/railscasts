atom_feed do |feed|
  feed.title "Superhero Articles"
  @articles.each do |article|
    feed.entry article do |entry|
      entry.title article.name
      entry.content article.content
      entry.author do |author|
        author.name article.author
      end
    end
  end
end
