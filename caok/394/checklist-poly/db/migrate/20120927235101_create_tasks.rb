class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.belongs_to :user
      t.string :name
      t.boolean :complete, default: false, null: false

      t.timestamps
    end
  end
end
