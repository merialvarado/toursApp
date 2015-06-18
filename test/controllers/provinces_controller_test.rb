require 'test_helper'

class ProvincesControllerTest < ActionController::TestCase
  setup do
    @province = provinces(:mendoza)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:provinces)
  end

  test "should get new" do
    user = users(:michael)
    sign_in user
    get :new
    assert_response :success
  end

  test "should create province" do
    user = users(:michael)
    sign_in user
    assert_difference('Province.count') do
      post :create, province: { name: @province.name }
    end

    assert_redirected_to province_path(assigns(:province))
  end

  test "should show province" do
    get :show, id: @province
    assert_response :success
  end

  test "should get edit" do
    user = users(:michael)
    sign_in user
    get :edit, id: @province
    assert_response :success
  end

  test "should update province" do
    user = users(:michael)
    sign_in user
    patch :update, id: @province, province: { name: @province.name }
    assert_redirected_to province_path(assigns(:province))
  end

  test "should destroy province" do
    user = users(:michael)
    sign_in user
    assert_difference('Province.count', -1) do
      delete :destroy, id: @province
    end

    assert_redirected_to provinces_path
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Province.count' do
      post :create, province: { name: "Lorem ipsum" }
    end
    assert_redirected_to '/users/sign_in'
  end

  test "should redirect update when not logged in" do
    patch :update, id: @province, province: { name: @province.name }
    assert_redirected_to '/users/sign_in'
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Province.count' do
      delete :destroy, id: @province
    end
    assert_redirected_to '/users/sign_in'
  end

  test "should redirect update when does not have permision" do
    user = users(:pablo)
    sign_in user
    patch :update, id: @province, province: { name: @province.name }
    assert_redirected_to root_path
  end

  test "should redirect destroy when does not have permision" do
    user = users(:pablo)
    sign_in user
    assert_no_difference 'Province.count' do
      delete :destroy, id: @province
    end
    assert_redirected_to root_path
  end

end
