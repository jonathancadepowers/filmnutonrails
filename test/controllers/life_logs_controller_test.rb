require 'test_helper'

class LifeLogsControllerTest < ActionDispatch::IntegrationTest
  test "should get all" do
    get life_logs_all_url
    assert_response :success
  end

end
