require 'test_helper'

class StarredItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @star = FactoryBot.create(:starred_item, user: @user, item: @item)
  end

  test "should get index" do
    get starred_items_path
    assert_response :success
    assert_not_nil assigns(:starred_items)
  end

  test "should get new" do
    get new_starred_item_path
    assert_response :success
  end

  test "should get create" do
    assert_difference('StarredItem.count') do
      post starred_items_path, params: { starred_item: { user_id: @user.id, item_id: @item.id } }
    end
    assert_redirected_to user_path(@user)

    post starred_items_path, params: { starred_item: { user_id: nil, item_id: nil } }
    assert_template :new
  end

  test "should get delete" do
    get starred_items_delete_url
    assert_response :success
  end

end
