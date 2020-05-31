class AddLifeLogIdToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :life_log_id, :integer
  end
end
