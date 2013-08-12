class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :name
      t.datetime :published_at
      t.belongs_to :author
      t.text :content

      t.timestamps
    end
    add_index :articles, :author_id
  end
end
