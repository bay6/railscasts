class AddLockVersionToProducts < ActiveRecord::Migration
  def change
    add_column :products, :lock_version, :integer
  end
end
