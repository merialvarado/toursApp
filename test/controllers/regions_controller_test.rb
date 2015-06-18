require 'test_helper'

class RegionsControllerTest < ActionController::TestCase
  setup do
    @region = regions(:lujan)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:regions)
  end

  test "should get new" do
    user = users(:michael)
    sign_in user
    get :new
    assert_response :success
  end

  test "should create region" do
    province = provinces(:mendoza)
    user = users(:michael)
    sign_in user
    assert_difference('Region.count') do
      post :create, region: { description: @region.description, name: @region.name, province_id: province.id }
    end

    assert_redirected_to region_path(assigns(:region))
  end

  test "should show region" do
    get :show, id: @region
    assert_response :success
  end

  test "should get edit" do
    user = users(:michael)
    sign_in user
    get :edit, id: @region
    assert_response :success
  end

  test "should update region" do
    user = users(:michael)
    sign_in user
    province = provinces(:mendoza)
    patch :update, id: @region, region: { description: @region.description, name: @region.name, province_id: province.id }
    assert_redirected_to region_path(assigns(:region))
  end

  test "should destroy region" do
    user = users(:michael)
    sign_in user
    assert_difference('Region.count', -1) do
      delete :destroy, id: @region
    end

    assert_redirected_to regions_path
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Region.count' do
      post :create, region: { name: "Lorem ipsum" }
    end
    assert_redirected_to '/users/sign_in'
  end

  test "should redirect update when not logged in" do
    patch :update, id: @region, region: { name: @region.name }
    assert_redirected_to '/users/sign_in'
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Region.count' do
      delete :destroy, id: @region
    end
    assert_redirected_to '/users/sign_in'
  end

  test "should redirect update when does not have permision" do
    user = users(:pablo)
    sign_in user
    patch :update, id: @region, region: { name: @region.name }
    assert_redirected_to root_path
  end

  test "should redirect destroy when does not have permision" do
    user = users(:pablo)
    sign_in user
    assert_no_difference 'Region.count' do
      delete :destroy, id: @region
    end
    assert_redirected_to root_path
  end
end
