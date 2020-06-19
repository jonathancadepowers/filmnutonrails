class RemoveUrlFromTvShowSeasons < ActiveRecord::Migration[5.2]
  def change
    remove_column :tv_show_seasons, :url
  end
end
