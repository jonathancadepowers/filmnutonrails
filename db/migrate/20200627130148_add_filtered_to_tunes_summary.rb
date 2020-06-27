class AddFilteredToTunesSummary < ActiveRecord::Migration[5.2]
  def change
    add_column :tunes_summaries, :artists_and_tracks_filtered, :json
  end
end
