class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :name
      t.decimal :price

      t.timestamps
    end
  end
end
