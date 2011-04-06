require 'test_helper'

class Admins::PromotionsControllerTest < ActionController::TestCase
  setup do
    @admins_promotion = admins_promotions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admins_promotions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admins_promotion" do
    assert_difference('Admins::Promotion.count') do
      post :create, :admins_promotion => @admins_promotion.attributes
    end

    assert_redirected_to admins_promotion_path(assigns(:admins_promotion))
  end

  test "should show admins_promotion" do
    get :show, :id => @admins_promotion.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @admins_promotion.to_param
    assert_response :success
  end

  test "should update admins_promotion" do
    put :update, :id => @admins_promotion.to_param, :admins_promotion => @admins_promotion.attributes
    assert_redirected_to admins_promotion_path(assigns(:admins_promotion))
  end

  test "should destroy admins_promotion" do
    assert_difference('Admins::Promotion.count', -1) do
      delete :destroy, :id => @admins_promotion.to_param
    end

    assert_redirected_to admins_promotions_path
  end
end
