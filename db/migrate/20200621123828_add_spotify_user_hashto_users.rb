class AddSpotifyUserHashtoUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :spotify_user, :json, default: {}
  end
end
