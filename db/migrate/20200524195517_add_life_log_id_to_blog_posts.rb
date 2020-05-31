class AddLifeLogIdToBlogPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :blog_posts, :life_log_id, :integer
  end
end
