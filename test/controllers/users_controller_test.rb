require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @user = users(:michael)
    @other_user = users(:pablo)
  end

  test "should redirect index when not logged in" do
    get :index
    assert_redirected_to '/users/sign_in'
  end

  test "should get new" do
    sign_in @user
    get :new
    assert_response :success
  end

  test "should destroy user" do
    sign_in @user
    assert_difference('User.count', -1) do
      delete :destroy, id: users(:pablo)
    end

    assert_redirected_to users_path
  end

  test "should get index" do
    sign_in @user
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should create user" do
    sign_in @user
    assert_difference('User.count') do
      post :create, user: { email: "sancho@panza.com", name: "sancho",
                            password: "password", password_confirmation: "password" }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    sign_in @user
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    sign_in @user
    get :edit, id: @user
    assert_response :success
  end

  test "should redirect edit when not logged in" do
    get :edit, id: @other_user
    assert_not flash.empty?
    assert_redirected_to '/users/sign_in'
  end

  test "should redirect update when not logged in" do
    patch :update, id: @other_user, user: { name: @other_user.name, email: @other_user.email }
    assert_not flash.empty?
    assert_redirected_to '/users/sign_in'
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'User.count' do
      delete :destroy, id: @user
    end
    assert_redirected_to '/users/sign_in'
  end

  test "should redirect destroy when logged in as a non-admin" do
    sign_in @other_user
    assert_no_difference 'User.count' do
      delete :destroy, id: @user
    end
    assert_redirected_to root_url
  end

  test "should redirect update when logged in as wrong user" do
    sign_in @other_user
    patch :update, id: @user, user: { name: @user.name, email: @user.email }
    assert_redirected_to root_url
  end

  test "should not allow the admin attribute to be edited via the web" do
    sign_in @other_user
    assert_not @other_user.admin?
    patch :update, id: @other_user, user: { password:              "password",
                                            password_confirmation: "password",
                                            role_id: roles(:admin).id }
    assert_not @other_user.reload.admin?
  end

end
