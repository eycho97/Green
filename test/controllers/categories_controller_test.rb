require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cat = FactoryBot.create(:category)
  end

  test "should get index" do
    get categories_path
    assert_response :success
    assert_not_nil assigns(:active_cats)
    assert_not_nil assigns(:inactive_cats)
  end

  test "should get new" do
    get new_category_path
    assert_response :success
  end

  test "should get create" do
    assert_difference('Category.count') do
      post categories_path, params: { category: { name: "News", active: true } }
    end
    assert_equal "Category News was added to the system.", flash[:notice]
    assert_redirected_to categories_path

    post categories_path, params: { category: { name: nil, active: true } }
    assert_template :new
  end

  test "should get edit" do
    get edit_category_path(@cat)
    assert_response :success
  end

  test "should get update" do
    patch category_path(@cat), params: { category: { name: @cat.name, active: false } }
    assert_equal "Category #{@cat.name} was updated.", flash[:notice]
    assert_redirected_to categories_path

    patch category_path(@cat), params: { category: { name: nil, active: nil } }
    assert_template :edit
  end

  # test "should get destroy" do
  #   get categories_destroy_url
  #   assert_response :success
  # end

end
