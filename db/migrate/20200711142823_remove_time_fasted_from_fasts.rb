class RemoveTimeFastedFromFasts < ActiveRecord::Migration[5.2]
  def change
    remove_column :fasts, :time_fasted, :time
  end
end
