require 'test_helper'

class Admins::MicrositesControllerTest < ActionController::TestCase
  setup do
    @admins_microsite = admins_microsites(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admins_microsites)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admins_microsite" do
    assert_difference('Admins::Microsite.count') do
      post :create, :admins_microsite => @admins_microsite.attributes
    end

    assert_redirected_to admins_microsite_path(assigns(:admins_microsite))
  end

  test "should show admins_microsite" do
    get :show, :id => @admins_microsite.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @admins_microsite.to_param
    assert_response :success
  end

  test "should update admins_microsite" do
    put :update, :id => @admins_microsite.to_param, :admins_microsite => @admins_microsite.attributes
    assert_redirected_to admins_microsite_path(assigns(:admins_microsite))
  end

  test "should destroy admins_microsite" do
    assert_difference('Admins::Microsite.count', -1) do
      delete :destroy, :id => @admins_microsite.to_param
    end

    assert_redirected_to admins_microsites_path
  end
end
