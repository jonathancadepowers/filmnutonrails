class CreateLifeLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :life_logs do |t|
      t.datetime :display_timestamp

      t.timestamps
    end
  end
end
