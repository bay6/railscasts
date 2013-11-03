class CreateViews < ActiveRecord::Migration
  def change
    create_table :views do |t|
      t.belongs_to :product
      t.integer :count

      t.timestamps
    end
    add_index :views, :product_id
  end
end
