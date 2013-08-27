class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :name
      t.boolean :booked

      t.timestamps
    end
  end
end
