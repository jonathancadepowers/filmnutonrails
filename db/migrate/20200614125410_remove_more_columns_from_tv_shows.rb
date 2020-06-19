class RemoveMoreColumnsFromTvShows < ActiveRecord::Migration[5.2]
  def change
    remove_column :tv_shows, :consumed_on
  end
end
