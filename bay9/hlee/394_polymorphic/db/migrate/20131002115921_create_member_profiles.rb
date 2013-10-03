class CreateMemberProfiles < ActiveRecord::Migration
  def change
    create_table :member_profiles do |t|
      t.string :username
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
