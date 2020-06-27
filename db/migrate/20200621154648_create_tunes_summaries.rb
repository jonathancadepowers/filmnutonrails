class CreateTunesSummaries < ActiveRecord::Migration[5.2]
  def change
    create_table :tunes_summaries do |t|
      t.datetime :summary_date
      t.json :artists_and_tracks
      t.timestamps
    end
  end
end
