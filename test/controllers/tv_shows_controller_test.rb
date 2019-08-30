require 'test_helper'

class TvShowsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get tv_shows_create_url
    assert_response :success
  end

  test "should get destroy" do
    get tv_shows_destroy_url
    assert_response :success
  end

  test "should get edit" do
    get tv_shows_edit_url
    assert_response :success
  end

  test "should get index" do
    get tv_shows_index_url
    assert_response :success
  end

  test "should get new" do
    get tv_shows_new_url
    assert_response :success
  end

  test "should get update" do
    get tv_shows_update_url
    assert_response :success
  end

end
