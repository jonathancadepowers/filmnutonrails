require 'test_helper'

class SpotifyControllerTest < ActionDispatch::IntegrationTest
  test "should get spotify" do
    get spotify_spotify_url
    assert_response :success
  end

end
