require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user  = FactoryBot.create(:user)
  end

  test "should get index" do
    get users_path
    assert_response :success
    assert_not_nil assigns(:active_employees)
    assert_not_nil assigns(:inactive_employees)
    assert_not_nil assigns(:active_customers)
    assert_not_nil assigns(:inactive_customers)
  end

  test "should get new" do
    get new_user_path
    assert_response :success
  end

  test "should get create" do
    assert_difference('User.count') do
      post users_path, params: { user: { first_name: "David", last_name: "Lee", email: "dlee@gmail.com", username: "dlee", role: "customer", password: "secret", password_confirmation: "secret", active: true } }
    end

    assert_equal "David Lee was added to the system.", flash[:notice]
    assert_redirected_to user_path(User.last)
  
    post users_path, params: { user: { first_name: "David", last_name: "Lee", email: "dlee@gmail.com", username: nil, role: "customer", password: "secret", password_confirmation: "secret", active: true } }
    assert_template :new
  end

  test "should get show" do
    get user_path(@user)
    assert_response :success
    assert_not_nil assigns(:starred_items)
  end

  test "should get edit" do
    get edit_user_path(@user)
    assert_response :success
  end

  test "should get update" do
    patch user_path(@user), params: { user: { first_name: "David", last_name: "Lee", email: "dlee@gmail.com", username: "dlee", role: "customer", password: "nosecret", password_confirmation: "nosecret", active: true } }
    assert_redirected_to user_path(@user)

    patch user_path(@user), params: { user: { first_name: "David", last_name: "Lee", email: "dlee@gmail.com", username: nil, role: "customer", password: "secret", password_confirmation: "secret", active: true  } }
    assert_template :edit
  end

  test "should get delete" do
    get users_delete_url
    assert_response :success
  end

end
