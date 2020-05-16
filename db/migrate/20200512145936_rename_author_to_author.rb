class RenameAuthorToAuthor < ActiveRecord::Migration[5.2]
  def change
    rename_column :books, :author, :authors
  end
end
