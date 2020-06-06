class RemoveMinutesFromRuns < ActiveRecord::Migration[5.2]
  def change
    remove_column :runs, :minutes, :time
  end
end
