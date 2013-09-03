class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :description
      t.string :image_url
      t.belongs_to :user

      t.timestamps
    end
    add_index :recipes, :user_id
  end
end
