class AddSeasonTitleToRuns < ActiveRecord::Migration[5.2]
  def change
    add_column :tv_show_seasons, :season_title, :string
  end
end
