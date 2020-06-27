class AddLifeLogIdToTunesSummary < ActiveRecord::Migration[5.2]
  def change
    add_column :tunes_summaries, :life_log_id, :integer
  end
end
