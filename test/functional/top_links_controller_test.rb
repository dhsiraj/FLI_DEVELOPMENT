require 'test_helper'

class TopLinksControllerTest < ActionController::TestCase
  setup do
    @top_link = top_links(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:top_links)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create top_link" do
    assert_difference('TopLink.count') do
      post :create, :top_link => @top_link.attributes
    end

    assert_redirected_to top_link_path(assigns(:top_link))
  end

  test "should show top_link" do
    get :show, :id => @top_link.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @top_link.to_param
    assert_response :success
  end

  test "should update top_link" do
    put :update, :id => @top_link.to_param, :top_link => @top_link.attributes
    assert_redirected_to top_link_path(assigns(:top_link))
  end

  test "should destroy top_link" do
    assert_difference('TopLink.count', -1) do
      delete :destroy, :id => @top_link.to_param
    end

    assert_redirected_to top_links_path
  end
end
