require 'test_helper'

class Admin::ProfilesControllerTest < ActionController::TestCase
  setup do
    @admins_profile = admins_profiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admins_profiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admins_profile" do
    assert_difference('Admin::Profile.count') do
      post :create, :admins_profile => @admins_profile.attributes
    end

    assert_redirected_to admins_profile_path(assigns(:admins_profile))
  end

  test "should show admins_profile" do
    get :show, :id => @admins_profile.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @admins_profile.to_param
    assert_response :success
  end

  test "should update admins_profile" do
    put :update, :id => @admins_profile.to_param, :admins_profile => @admins_profile.attributes
    assert_redirected_to admins_profile_path(assigns(:admins_profile))
  end

  test "should destroy admins_profile" do
    assert_difference('Admin::Profile.count', -1) do
      delete :destroy, :id => @admins_profile.to_param
    end

    assert_redirected_to admins_profiles_path
  end
end
