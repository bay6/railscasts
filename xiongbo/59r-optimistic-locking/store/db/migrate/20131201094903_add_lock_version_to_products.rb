class AddLockVersionToProducts < ActiveRecord::Migration
  def change
    add_column :products, :lock_version, :integer, default: 0, null: false
  end
end
