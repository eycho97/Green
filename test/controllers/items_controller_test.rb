require 'test_helper'

class ItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @item = FactoryBot.create(:item)
  end

  test "should get index" do
    get items_path
    assert_response :success
    assert_not_nil assigns(:active_items)
    assert_not_nil assigns(:inactive_items)
  end

  test "should get new" do
    get new_item_path
    assert_response :success
  end

  test "should get create" do
    assert_difference('Item.count') do
      post items_path, params: { item: { title: "Farmer's", blurb: "good fruit", description: "", picture: "farmers.png", link: "farmers.com", featured: false, active: true } }
    end

    assert_equal "Successfully added Farmer's to the system.", flash[:notice]
    assert_redirected_to item_path(Item.last)
  
    post items_path, params: { item: { title: nil, blurb: "good fruit", description: "", picture: "farmers.png", link: "farmers.com", featured: false, active: true } }
    assert_template :new
  end

  test "should get show" do
    get item_path(@item)
    assert_response :success
  end

  test "should get edit" do
    get edit_item_path(@item)
    assert_response :success
  end

  test "should get update" do
    patch item_path(@item), params: { item: { title: @item.title, blurb: @item.blurb, description: "", picture: @item.picture, link: @item.link, featured: true, active: @item.active } }
    assert_redirected_to item_path(@item)

    assert_equal "Successfully updated #{@item.title}.", flash[:notice]

    patch item_path(@item), params: { item: { title: nil, blurb: @item.blurb, description: "great market", picture: @item.picture, link: @item.link, featured: true, active: @item.active } }
    assert_template :edit
  end

  # test "should get destroy" do
  #   get items_destroy_url
  #   assert_response :success
  # end

end
