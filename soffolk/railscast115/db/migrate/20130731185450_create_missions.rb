class CreateMissions < ActiveRecord::Migration
  def change
    create_table :missions do |t|
      t.string :name
      t.text :description
      t.integer :creator
      t.integer :assigned_to
      t.string :status
      t.datetime :start_time
      t.datetime :finish_time

      t.timestamps
    end
  end
end
