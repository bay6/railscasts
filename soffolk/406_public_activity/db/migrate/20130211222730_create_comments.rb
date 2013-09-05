class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.belongs_to :user
      t.belongs_to :recipe

      t.timestamps
    end
    add_index :comments, :user_id
    add_index :comments, :recipe_id
  end
end
