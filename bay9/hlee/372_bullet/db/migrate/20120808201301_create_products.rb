class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.belongs_to :category
      t.string :name
      t.decimal :price, :precision => 2, :scale => 8

      t.timestamps
    end
    add_index :products, :category_id
  end
end
