class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.text :url
      t.integer :rating
      t.datetime :consumed_on

      t.timestamps
    end
  end
end
