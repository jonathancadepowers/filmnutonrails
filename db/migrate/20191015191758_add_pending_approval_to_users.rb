class AddPendingApprovalToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :pending_approval, :boolean
  end
end
