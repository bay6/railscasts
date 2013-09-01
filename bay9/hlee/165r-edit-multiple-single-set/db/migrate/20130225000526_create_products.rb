class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.belongs_to :category
      t.string :name
      t.decimal :price
      t.boolean :discontinued, default: false, null: false
      t.timestamps
    end
    add_index :products, :category_id
  end
end
