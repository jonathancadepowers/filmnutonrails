class AddLifeLogIdToRuns < ActiveRecord::Migration[5.2]
  def change
    add_column :runs, :life_log_id, :integer
  end
end
