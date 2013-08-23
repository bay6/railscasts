# rails casts practice -- 22r eager loading 

## approach
1. use includes to avoid N+1 problem

`Product.order("name").includes(:category)`

2. use joins to handle associated data

`Product.order("categories.name").includes(:category)`

3. use select to fetch part data

`Product.order("categories.name").includes(:category).select('products.*, categories.name as category_name')`
_?q this also cause N+1 problem_

4. more on joins

```ruby
Product.joins(:category, :reviews)
# SELECT "products".* FROM "products" INNER JOIN "categories" ON "categories"."id" = "products"."category_id" INNER JOIN "reviews" ON "reviews"."product_id" = "products"."id"

Product.joins(:category, :reviews => :user)
# SELECT "products".* FROM "products" INNER JOIN "categories" ON "categories"."id" = "products"."category_id" INNER JOIN "reviews" ON "reviews"."product_id" = "products"."id" INNER JOIN "users" ON "users"."id" = "reviews"."user_id"

Product.joins("left outer join categories on category_id = categories.id")
# SELECT "products".* FROM "products" left outer join categories on category_id = categories.id
``` 
