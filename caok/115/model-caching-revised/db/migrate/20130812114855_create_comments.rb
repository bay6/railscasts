class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :article, index: true
      t.string :name
      t.text :content

      t.timestamps
    end
  end
end
