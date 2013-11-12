class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.belongs_to :product
      t.string :name

      t.timestamps
    end
    add_index :reviews, :product_id
  end
end
