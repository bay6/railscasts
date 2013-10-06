class CreateSearchSuggustions < ActiveRecord::Migration
  def change
    create_table :search_suggustions do |t|
      t.string :term
      t.integer :popular

      t.timestamps
    end
  end
end
