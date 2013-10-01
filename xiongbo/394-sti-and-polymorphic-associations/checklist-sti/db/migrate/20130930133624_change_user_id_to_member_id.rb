class ChangeUserIdToMemberId < ActiveRecord::Migration
  def change
    drop_table :tasks
    create_table :tasks do |t|
      t.belongs_to :member
      t.string :name
      t.boolean :complete, default: false, null: false

      t.timestamps
    end
  end 
end
