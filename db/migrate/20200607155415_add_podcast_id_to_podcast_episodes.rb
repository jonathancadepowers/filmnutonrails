class AddPodcastIdToPodcastEpisodes < ActiveRecord::Migration[5.2]
  def change
    add_column :podcast_episodes, :podcast_id, :integer
  end
end
