class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.belongs_to :user
      t.string :twitter_name
      t.string :github_name
      t.text :bio

      t.timestamps
    end
    add_index :profiles, :user_id
  end
end
