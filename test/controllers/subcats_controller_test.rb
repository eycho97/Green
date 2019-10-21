require 'test_helper'

class SubcatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cat = FactoryBot.create(:category)
    @subcat = FactoryBot.create(:subcat, category: @cat)
  end

  test "should get index" do
    get subcats_path
    assert_response :success
  end

  test "should get new" do
    get new_subcat_path
    assert_response :success
  end

  test "should get create" do
    assert_difference('Subcat.count') do
      post subcats_path, params: { subcat: { category_id: @cat.id, name: "Breaking News", active: true } }
    end
    assert_equal "Sub Category Breaking News was added to the system.", flash[:notice]
    assert_redirected_to subcats_path

    post subcats_path, params: { subcat: { category_id: nil, name: "Breaking News", active: true } }
    assert_template :new
  end

  test "should get edit" do
    get edit_subcat_path(@subcat)
    assert_response :success
  end

  test "should get update" do
    patch subcat_path(@subcat), params: { subcat: { category_id: @cat.id, name: @subcat.name, active: false } }
    assert_equal "Sub Category #{@subcat.name} was updated.", flash[:notice]
    assert_redirected_to subcats_path

    patch subcat_path(@subcat), params: { subcat: { category_id: @cat.id, name: nil, active: true } }
    assert_template :edit
  end

  # test "should get destroy" do
  #   get subcats_destroy_path
  #   assert_response :success
  # end

end
