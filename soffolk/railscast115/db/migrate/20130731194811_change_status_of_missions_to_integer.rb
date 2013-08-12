class ChangeStatusOfMissionsToInteger < ActiveRecord::Migration
  def up
    change_column :missions, :status, :integer
  end

  def down
    change_column :missions, :status, :string
  end
end
