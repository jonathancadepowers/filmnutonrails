# frozen_string_literal: true

module SpotifyHelper
  def callback_success
    flash[:notice] = "Success! Filmnut user linked with Spotify user."
  end

  def callback_failure(user)
    flash[:error] = "Uh oh! Something went wrong.
      Error(s): " + user.errors.full_messages.to_sentence
  end
end
