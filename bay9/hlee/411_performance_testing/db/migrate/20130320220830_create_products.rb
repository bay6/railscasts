class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.belongs_to :category

      t.timestamps
    end
    add_index :products, :category_id
  end
end
