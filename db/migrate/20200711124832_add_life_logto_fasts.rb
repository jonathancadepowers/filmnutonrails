class AddLifeLogtoFasts < ActiveRecord::Migration[5.2]
  def change
    add_column :fasts, :life_log_id, :integer
  end
end
