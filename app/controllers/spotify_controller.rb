# frozen_string_literal: true

class SpotifyController < ApplicationController
  def callback
    spotify_user = RSpotify::User.new(request.env["omniauth.auth"])
                                 .to_hash
    user = User.find { |u| u.email == spotify_user["email"] }
    result = user.update(spotify_user: spotify_user)
    result ? helpers.callback_success : helpers.callback_failure(user)
    redirect_to(controller: "users", action: "index")
  end
end
