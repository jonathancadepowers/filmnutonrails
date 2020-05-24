class AddRecommendedToBlogPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :blog_posts, :recommended, :boolean, default: :false
  end
end
