class CreateRuns < ActiveRecord::Migration[5.2]
  def change
    create_table :runs do |t|
      t.float :miles
      t.time :minutes
      t.string :location

      t.timestamps
    end
  end
end
