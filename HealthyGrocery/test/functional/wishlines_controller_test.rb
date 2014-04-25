require 'test_helper'

class WishlinesControllerTest < ActionController::TestCase
  setup do
    @wishline = wishlines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wishlines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wishline" do
    assert_difference('Wishline.count') do
      post :create, wishline: { quantity: @wishline.quantity }
    end

    assert_redirected_to wishline_path(assigns(:wishline))
  end

  test "should show wishline" do
    get :show, id: @wishline
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @wishline
    assert_response :success
  end

  test "should update wishline" do
    put :update, id: @wishline, wishline: { quantity: @wishline.quantity }
    assert_redirected_to wishline_path(assigns(:wishline))
  end

  test "should destroy wishline" do
    assert_difference('Wishline.count', -1) do
      delete :destroy, id: @wishline
    end

    assert_redirected_to wishlines_path
  end
end
