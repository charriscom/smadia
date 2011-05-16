require 'test_helper'

class Admins::FormsControllerTest < ActionController::TestCase
  setup do
    @admins_form = admins_forms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admins_forms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admins_form" do
    assert_difference('Admins::Form.count') do
      post :create, :admins_form => @admins_form.attributes
    end

    assert_redirected_to admins_form_path(assigns(:admins_form))
  end

  test "should show admins_form" do
    get :show, :id => @admins_form.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @admins_form.to_param
    assert_response :success
  end

  test "should update admins_form" do
    put :update, :id => @admins_form.to_param, :admins_form => @admins_form.attributes
    assert_redirected_to admins_form_path(assigns(:admins_form))
  end

  test "should destroy admins_form" do
    assert_difference('Admins::Form.count', -1) do
      delete :destroy, :id => @admins_form.to_param
    end

    assert_redirected_to admins_forms_path
  end
end
