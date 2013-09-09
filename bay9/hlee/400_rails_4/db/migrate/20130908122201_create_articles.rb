class CreateArticles < ActiveRecord::Migration
  def change
    execute "create extension hstore"
    create_table :articles do |t|
      t.string :name
      t.text :content
      t.date :published_on
      t.string :tags, array: true
      t.hstore :properties

      t.timestamps
    end
  end
end
