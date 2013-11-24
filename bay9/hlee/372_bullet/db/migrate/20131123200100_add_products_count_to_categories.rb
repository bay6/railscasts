class AddProductsCountToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :products_count, :integer
  end
end
