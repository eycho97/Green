require 'test_helper'

class SubcatsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get subcats_index_url
    assert_response :success
  end

  test "should get new" do
    get subcats_new_url
    assert_response :success
  end

  test "should get create" do
    get subcats_create_url
    assert_response :success
  end

  test "should get edit" do
    get subcats_edit_url
    assert_response :success
  end

  test "should get update" do
    get subcats_update_url
    assert_response :success
  end

  test "should get delete" do
    get subcats_delete_url
    assert_response :success
  end

end
