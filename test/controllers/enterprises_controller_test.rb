require 'test_helper'

class EnterprisesControllerTest < ActionController::TestCase
  setup do
    @enterprise = enterprises(:one)
    @user = users(:pablo)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:enterprises)
  end

  test "should get new" do
    sign_in users(:michael)
    get :new
    assert_response :success
  end

  test "should create enterprise" do
    sign_in users(:michael)
    assert_difference('Enterprise.count') do
      post :create, enterprise: { description: @enterprise.description, name: @enterprise.name, region_id: @enterprise.region_id, user_id: @user.id, phone_number: @enterprise.phone_number, postal_code: @enterprise.postal_code }
    end

    assert_redirected_to enterprise_path(assigns(:enterprise))
  end

  test "should show enterprise" do
    get :show, id: @enterprise
    assert_response :success
  end

  test "should get edit" do
    sign_in @user
    get :edit, id: @enterprise
    assert_response :success
  end

  test "should update enterprise" do
    sign_in @user
    patch :update, id: @enterprise, enterprise: { description: @enterprise.description, name: @enterprise.name, region_id: @enterprise.region_id, user_id: @user.id }
    assert_redirected_to enterprise_path(assigns(:enterprise))
  end

  test "should destroy enterprise" do
    sign_in users(:michael)
    assert_difference('Enterprise.count', -1) do
      delete :destroy, id: @enterprise
    end

    assert_redirected_to enterprises_path
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Enterprise.count' do
      post :create, enterprise: { name: "Lorem ipsum", description: "Description of Lorem ipsum" }
    end
    assert_redirected_to '/users/sign_in'
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Enterprise.count' do
      delete :destroy, id: @enterprise
    end
    assert_redirected_to '/users/sign_in'
  end

  test "should redirect destroy for wrong enterprise" do
    sign_in @user
    enterprise = enterprises(:two)
    assert_no_difference 'Enterprise.count' do
      delete :destroy, id: enterprise
    end
    assert_redirected_to root_url
  end
end
