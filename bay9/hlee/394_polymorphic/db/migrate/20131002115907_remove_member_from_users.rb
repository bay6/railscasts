class RemoveMemberFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :username
    remove_column :users, :email
    remove_column :users, :password_digest
    remove_column :users, :type
  end

  def down
    add_column :users, :type, :string
    add_column :users, :password_digest, :string
    add_column :users, :email, :string
    add_column :users, :username, :string
  end
end
