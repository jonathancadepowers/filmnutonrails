class AddRelatedObjectTypeToLifeLogs < ActiveRecord::Migration[5.2]
  def change
    add_column :life_logs, :related_object_type, :string
  end
end
