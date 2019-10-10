require 'test_helper'

class StarredItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get starred_items_index_url
    assert_response :success
  end

  test "should get new" do
    get starred_items_new_url
    assert_response :success
  end

  test "should get create" do
    get starred_items_create_url
    assert_response :success
  end

  test "should get show" do
    get starred_items_show_url
    assert_response :success
  end

  test "should get delete" do
    get starred_items_delete_url
    assert_response :success
  end

end
