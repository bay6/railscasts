class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :name
      t.string :pic
      t.string :borrower

      t.timestamps
    end
  end
end
