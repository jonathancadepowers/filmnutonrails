class SetDefaultForPendingApproval < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :pending_approval, :boolean, :default => true
  end
end
