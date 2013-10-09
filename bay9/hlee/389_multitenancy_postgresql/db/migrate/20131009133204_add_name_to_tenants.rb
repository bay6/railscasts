class AddNameToTenants < ActiveRecord::Migration
  def change
    add_column :tenants, :name, :string if table_exists? :tenants
  end
end
