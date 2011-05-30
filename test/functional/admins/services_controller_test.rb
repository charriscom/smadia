require 'test_helper'

class Admins::ServicesControllerTest < ActionController::TestCase
  setup do
    @admins_service = admins_services(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admins_services)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admins_service" do
    assert_difference('Admins::Service.count') do
      post :create, :admins_service => @admins_service.attributes
    end

    assert_redirected_to admins_service_path(assigns(:admins_service))
  end

  test "should show admins_service" do
    get :show, :id => @admins_service.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @admins_service.to_param
    assert_response :success
  end

  test "should update admins_service" do
    put :update, :id => @admins_service.to_param, :admins_service => @admins_service.attributes
    assert_redirected_to admins_service_path(assigns(:admins_service))
  end

  test "should destroy admins_service" do
    assert_difference('Admins::Service.count', -1) do
      delete :destroy, :id => @admins_service.to_param
    end

    assert_redirected_to admins_services_path
  end
end
