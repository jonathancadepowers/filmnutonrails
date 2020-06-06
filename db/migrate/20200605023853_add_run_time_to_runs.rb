class AddRunTimeToRuns < ActiveRecord::Migration[5.2]
  def change
    add_column :runs, :run_time, :decimal
  end
end
