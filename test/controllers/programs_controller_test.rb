require 'test_helper'

class ProgramsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @program = programs(:one)
    @enterprise = enterprises(:one)
    @user = users(:pablo)
    @program.user = @user
    sign_in @user
  end

  test "should get index" do
    get 'index'
    assert_response :success
    assert_not_nil assigns(:programs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create program" do
    assert_difference('Program.count') do
      post :create, program: { description: @program.description, name: @program.name, price: 99, user_id: @user.id, enterprise_id: @enterprise.id }
    end

    assert_redirected_to program_path(assigns(:program))
  end

  test "should show program" do
    get :show, id: @program
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @program
    assert_response :success
  end

  test "should update program" do
    patch :update, id: @program, program: { description: @program.description, name: @program.name, user_id: @program.user_id }
    assert_redirected_to program_path(assigns(:program))
  end

  test "should destroy program" do
    programa2 = programs(:two)
    assert_difference('Program.count', -1) do
      delete :destroy, id: programa2
    end

    assert_redirected_to programs_path
  end


  test "should redirect create when not logged in" do
    sign_out @user
    assert_no_difference 'Program.count' do
      post :create, program: { name: "Lorem ipsum", description: "Description of Lorem ipsum" }
    end
    assert_redirected_to '/users/sign_in'
  end

  test "should redirect destroy when not logged in" do
    sign_out @user
    assert_no_difference 'Program.count' do
      delete :destroy, id: @program
    end
    assert_redirected_to '/users/sign_in'
  end

  test "should redirect destroy for wrong program" do
    program = programs(:three)
    assert_no_difference 'Program.count' do
      delete :destroy, id: program
    end
    assert_redirected_to root_url
  end

end
