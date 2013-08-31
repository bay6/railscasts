class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.belongs_to :author
      t.string :name
      t.string :content
      t.datetime :published_at

      t.timestamps
    end
    add_index :articles, :author_id
  end
end
