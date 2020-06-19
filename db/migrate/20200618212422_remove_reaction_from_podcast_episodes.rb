class RemoveReactionFromPodcastEpisodes < ActiveRecord::Migration[5.2]
  def change
    remove_column :podcast_episodes, :reaction
  end
end
