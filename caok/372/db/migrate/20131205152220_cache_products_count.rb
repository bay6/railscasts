class CacheProductsCount < ActiveRecord::Migration
  def up
    execute "update categories set products_count=(select count(*) from products where category_id=categories.id)"
  end

  def down
  end
end
