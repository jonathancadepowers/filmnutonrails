class RemoveColumnsFromTvShows < ActiveRecord::Migration[5.2]
  def change
    remove_column :tv_shows, :rating
    remove_column :tv_shows, :life_log_id
  end
end
