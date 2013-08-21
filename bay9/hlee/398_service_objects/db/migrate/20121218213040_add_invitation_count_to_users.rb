class AddInvitationCountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :invitation_count, :integer
  end
end
