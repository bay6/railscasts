class CreateGuestProfiles < ActiveRecord::Migration
  def change
    create_table :guest_profiles do |t|

      t.timestamps
    end
  end
end
