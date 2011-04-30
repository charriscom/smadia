require 'test_helper'

class Admins::CommentsControllerTest < ActionController::TestCase
  setup do
    @admins_comment = admins_comments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admins_comments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admins_comment" do
    assert_difference('Admins::Comment.count') do
      post :create, :admins_comment => @admins_comment.attributes
    end

    assert_redirected_to admins_comment_path(assigns(:admins_comment))
  end

  test "should show admins_comment" do
    get :show, :id => @admins_comment.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @admins_comment.to_param
    assert_response :success
  end

  test "should update admins_comment" do
    put :update, :id => @admins_comment.to_param, :admins_comment => @admins_comment.attributes
    assert_redirected_to admins_comment_path(assigns(:admins_comment))
  end

  test "should destroy admins_comment" do
    assert_difference('Admins::Comment.count', -1) do
      delete :destroy, :id => @admins_comment.to_param
    end

    assert_redirected_to admins_comments_path
  end
end
