require "test_helper"

class Restaurant::PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get restaurant_posts_new_url
    assert_response :success
  end

  test "should get create" do
    get restaurant_posts_create_url
    assert_response :success
  end

  test "should get index" do
    get restaurant_posts_index_url
    assert_response :success
  end

  test "should get show" do
    get restaurant_posts_show_url
    assert_response :success
  end

  test "should get edit" do
    get restaurant_posts_edit_url
    assert_response :success
  end

  test "should get update" do
    get restaurant_posts_update_url
    assert_response :success
  end

  test "should get destroy" do
    get restaurant_posts_destroy_url
    assert_response :success
  end
end
