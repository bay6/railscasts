class AddStickyToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :sticky, :boolean
  end
end
