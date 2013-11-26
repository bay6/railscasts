class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.belongs_to :category
      t.string :name
      t.decimal :price, :precision => 2, :scale => 8
      t.date :released_on
      t.integer :view_count, default: 0, null: false

      t.timestamps
    end
    add_index :products, :category_id
  end
end
