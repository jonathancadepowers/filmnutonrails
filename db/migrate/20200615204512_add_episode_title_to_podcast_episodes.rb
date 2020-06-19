class AddEpisodeTitleToPodcastEpisodes < ActiveRecord::Migration[5.2]
  def change
    add_column :podcast_episodes, :episode_title, :string
  end
end
