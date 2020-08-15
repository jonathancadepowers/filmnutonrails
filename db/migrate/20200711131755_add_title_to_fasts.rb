class AddTitleToFasts < ActiveRecord::Migration[5.2]
  def change
    add_column :fasts, :title, :string
  end
end
