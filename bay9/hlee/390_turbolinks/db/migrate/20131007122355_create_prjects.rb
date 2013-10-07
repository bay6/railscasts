class CreatePrjects < ActiveRecord::Migration
  def change
    create_table :prjects do |t|
      t.string :name

      t.timestamps
    end
  end
end
