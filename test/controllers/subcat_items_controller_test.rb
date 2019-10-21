require 'test_helper'

class SubcatItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @item = FactoryBot.create(:item)
    @cat = FactoryBot.create(:category)
    @subcat = FactoryBot.create(:subcat, category: @cat)
    @sitem = FactoryBot.create(:subcat_item, item: @item, subcat: @subcat)
  end

  test "should get index" do
    get subcat_items_path
    assert_response :success
    assert_not_nil assigns(:all_subcat_items)
  end

  test "should get new" do
    get new_subcat_item_path
    assert_response :success
  end

  test "should get create" do
    assert_difference('SubcatItem.count') do
      post subcat_items_path, params: { subcat_item: { subcat_id: @subcat.id, item_id: @item.id } }
    end
    assert_redirected_to item_path(@item)

    post subcat_items_path, params: { subcat_item: { subcat_id: nil, item_id: @item.id } }
    assert_template :new
  end


end
