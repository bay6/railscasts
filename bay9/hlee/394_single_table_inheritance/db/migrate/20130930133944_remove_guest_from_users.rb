class RemoveGuestFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :guest
  end

  def down
    add_column :users, :guest, :boolean
  end
end
