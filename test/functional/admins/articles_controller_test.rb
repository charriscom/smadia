require 'test_helper'

class Admins::ArticlesControllerTest < ActionController::TestCase
  setup do
    @admins_article = admins_articles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admins_articles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admins_article" do
    assert_difference('Admins::Article.count') do
      post :create, :admins_article => @admins_article.attributes
    end

    assert_redirected_to admins_article_path(assigns(:admins_article))
  end

  test "should show admins_article" do
    get :show, :id => @admins_article.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @admins_article.to_param
    assert_response :success
  end

  test "should update admins_article" do
    put :update, :id => @admins_article.to_param, :admins_article => @admins_article.attributes
    assert_redirected_to admins_article_path(assigns(:admins_article))
  end

  test "should destroy admins_article" do
    assert_difference('Admins::Article.count', -1) do
      delete :destroy, :id => @admins_article.to_param
    end

    assert_redirected_to admins_articles_path
  end
end
