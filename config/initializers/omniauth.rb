require 'rspotify/oauth'

Rails.application.config.to_prepare do
  OmniAuth::Strategies::Spotify.include SpotifyOmniauthExtension
end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, "59966b30b87943ce99dd736880815410", "b06aab6c2a7f489f8aa256a149791f18", scope: 'user-read-recently-played user-read-email'
end