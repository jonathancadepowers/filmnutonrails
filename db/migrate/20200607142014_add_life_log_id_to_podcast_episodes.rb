class AddLifeLogIdToPodcastEpisodes < ActiveRecord::Migration[5.2]
  def change
    add_column :podcast_episodes, :life_log_id, :integer
  end
end
