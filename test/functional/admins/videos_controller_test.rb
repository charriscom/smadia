require 'test_helper'

class Admins::VideosControllerTest < ActionController::TestCase
  setup do
    @admins_video = admins_videos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admins_videos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admins_video" do
    assert_difference('Admins::Video.count') do
      post :create, :admins_video => @admins_video.attributes
    end

    assert_redirected_to admins_video_path(assigns(:admins_video))
  end

  test "should show admins_video" do
    get :show, :id => @admins_video.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @admins_video.to_param
    assert_response :success
  end

  test "should update admins_video" do
    put :update, :id => @admins_video.to_param, :admins_video => @admins_video.attributes
    assert_redirected_to admins_video_path(assigns(:admins_video))
  end

  test "should destroy admins_video" do
    assert_difference('Admins::Video.count', -1) do
      delete :destroy, :id => @admins_video.to_param
    end

    assert_redirected_to admins_videos_path
  end
end
