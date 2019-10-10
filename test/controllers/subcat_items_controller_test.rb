require 'test_helper'

class SubcatItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get subcat_items_index_url
    assert_response :success
  end

  test "should get new" do
    get subcat_items_new_url
    assert_response :success
  end

  test "should get create" do
    get subcat_items_create_url
    assert_response :success
  end

  test "should get show" do
    get subcat_items_show_url
    assert_response :success
  end

end
