class CreateTvShows < ActiveRecord::Migration[5.2]
  def change
    create_table :tv_shows do |t|
      t.string :title
      t.string :url
      t.integer :rating
      t.datetime :watched_on

      t.timestamps
    end
  end
end
