class CreateTenants < ActiveRecord::Migration
  def change
    create_table :tenants do |t|
      t.string :subdomain

      t.timestamps
    end
  end
end
