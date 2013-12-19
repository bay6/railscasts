class CreateHaikuVotes < ActiveRecord::Migration
  def change
    create_table :haiku_votes do |t|
      t.string :value
      t.integer :haiku_id

      t.timestamps
    end
  end
end
