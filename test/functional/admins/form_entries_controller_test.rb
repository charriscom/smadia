require 'test_helper'

class Admins::FormEntriesControllerTest < ActionController::TestCase
  setup do
    @admins_form_entry = admins_form_entries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admins_form_entries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admins_form_entry" do
    assert_difference('Admins::FormEntry.count') do
      post :create, :admins_form_entry => @admins_form_entry.attributes
    end

    assert_redirected_to admins_form_entry_path(assigns(:admins_form_entry))
  end

  test "should show admins_form_entry" do
    get :show, :id => @admins_form_entry.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @admins_form_entry.to_param
    assert_response :success
  end

  test "should update admins_form_entry" do
    put :update, :id => @admins_form_entry.to_param, :admins_form_entry => @admins_form_entry.attributes
    assert_redirected_to admins_form_entry_path(assigns(:admins_form_entry))
  end

  test "should destroy admins_form_entry" do
    assert_difference('Admins::FormEntry.count', -1) do
      delete :destroy, :id => @admins_form_entry.to_param
    end

    assert_redirected_to admins_form_entries_path
  end
end
