class CreatePodcastEpisodes < ActiveRecord::Migration[5.2]
  def change
    create_table :podcast_episodes do |t|
      t.string :title
      t.string :reaction
      t.datetime :consumed_on

      t.timestamps
    end
  end
end
