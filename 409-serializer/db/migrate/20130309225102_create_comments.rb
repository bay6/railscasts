class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.belongs_to :article
      t.string :name
      t.string :content

      t.timestamps
    end
    add_index :comments, :article_id
  end
end
