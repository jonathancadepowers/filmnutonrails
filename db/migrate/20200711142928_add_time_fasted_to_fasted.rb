class AddTimeFastedToFasted < ActiveRecord::Migration[5.2]
  def change
    add_column :fasts, :time_fasted, :decimal
  end
end
