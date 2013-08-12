class RenameColumnOfMissions < ActiveRecord::Migration
  def change
    rename_column :missions, :creator, :creator_id
    rename_column :missions, :assigned_to, :assigned_to_id
  end
end
