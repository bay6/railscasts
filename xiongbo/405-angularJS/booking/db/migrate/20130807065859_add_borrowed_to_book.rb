class AddBorrowedToBook < ActiveRecord::Migration
  def change
    add_column :books, :borrowed, :boolean, default: false
  end
end
