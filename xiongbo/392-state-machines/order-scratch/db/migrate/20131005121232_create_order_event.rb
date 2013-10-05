class CreateOrderEvent < ActiveRecord::Migration
  def change
    create_table :order_events do |t|
      t.belongs_to :order
      t.string :state
      t.timestamps
    end
    add_index :order_events, :order_id
  end
end
