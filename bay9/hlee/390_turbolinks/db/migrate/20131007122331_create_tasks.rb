class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.references :project
      t.string :name
      t.boolean :complete

      t.timestamps
    end
    add_index :tasks, :project_id
  end
end
