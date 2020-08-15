class CreateFasts < ActiveRecord::Migration[5.2]
  def change
    create_table :fasts do |t|
      t.time :time_fasted
      t.timestamps
    end
  end
end
