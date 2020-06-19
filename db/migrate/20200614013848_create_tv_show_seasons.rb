class CreateTvShowSeasons < ActiveRecord::Migration[5.2]
  def change
    create_table :tv_show_seasons do |t|
      t.string :title
      t.string :url
      t.integer :rating
      t.datetime :consumed_on
      t.integer :life_log_id
      t.integer :tv_show_id
      
      t.timestamps
    end
  end
end
