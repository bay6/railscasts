class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.decimal :price, :precision => 2, :scale => 8
      t.datetime :purchased_at
      t.boolean :shipping

      t.timestamps
    end
  end
end
