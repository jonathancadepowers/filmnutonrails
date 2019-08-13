require 'test_helper'

class FilmsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get films_path
    assert_response :success
  end
end
