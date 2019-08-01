class CreateFilms < ActiveRecord::Migration[5.2]
  def change
    create_table :films do |t|
      t.string :title
      t.string :url
      t.integer :rating
      t.datetime :watched_on
      t.string :directors
      t.integer :release_year
      t.float :running_time

      t.timestamps
    end
  end
end
