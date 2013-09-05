ryan = User.create! name: "Ryan", password: "secret"
joe = User.create! name: "Joe", password: "secret"
anne = User.create! name: "Anne", password: "secret"

ryan.recipes.create! do |recipe|
  recipe.name = "Marbled Cheesecake"
  recipe.image_url = "http://images.media-allrecipes.com/global/recipes/small/91718.jpg"
  recipe.description = "A rich and creamy favorite, this cheesecake is marbled with swirls of vanilla and chocolate. (from allrecipes.com)"
  recipe.comments.build do |comment|
    comment.user = anne
    comment.content = "It looks delicious!"
  end
  recipe.comments.build do |comment|
    comment.user = joe
    comment.content = "Mmmm!"
  end
end

anne.recipes.create! do |recipe|
  recipe.name = "Lasagnia"
  recipe.image_url = "http://images.media-allrecipes.com/global/recipes/small/177626.jpg"
  recipe.description = "Traditional, full-flavored lasagna is layered together in just minutes with pasta sauce, noodles, and three cheeses. (from allrecipes.com)"
  recipe.comments.build do |comment|
    comment.user = joe
    comment.content = "Can't wait to try this."
  end
end

joe.recipes.create! do |recipe|
  recipe.name = "Steak Soup"
  recipe.description = "This is an extremely hearty soup that only gets better in the fridge! It is one of the only soups you will not have to jazz up on your own, and people will remember you for it! This is a great cold-weather soup, but my family requests it all year long. (from allrecipes.com)"
  recipe.image_url = "http://images.media-allrecipes.com/userphotos/140x140/00/48/86/488609.jpg"
end
