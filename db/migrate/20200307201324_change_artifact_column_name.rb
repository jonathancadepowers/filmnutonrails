class ChangeArtifactColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :artifacts, :name, :title
  end
end
