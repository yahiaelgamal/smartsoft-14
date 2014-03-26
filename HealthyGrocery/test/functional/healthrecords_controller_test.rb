require 'test_helper'

class HealthrecordsControllerTest < ActionController::TestCase
  setup do
    @healthrecord = healthrecords(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:healthrecords)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create healthrecord" do
    assert_difference('Healthrecord.count') do
      post :create, healthrecord: { bmi: @healthrecord.bmi, fats: @healthrecord.fats, height: @healthrecord.height, id: @healthrecord.id, name: @healthrecord.name, program: @healthrecord.program, weight: @healthrecord.weight }
    end

    assert_redirected_to healthrecord_path(assigns(:healthrecord))
  end

  test "should show healthrecord" do
    get :show, id: @healthrecord
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @healthrecord
    assert_response :success
  end

  test "should update healthrecord" do
    put :update, id: @healthrecord, healthrecord: { bmi: @healthrecord.bmi, fats: @healthrecord.fats, height: @healthrecord.height, id: @healthrecord.id, name: @healthrecord.name, program: @healthrecord.program, weight: @healthrecord.weight }
    assert_redirected_to healthrecord_path(assigns(:healthrecord))
  end

  test "should destroy healthrecord" do
    assert_difference('Healthrecord.count', -1) do
      delete :destroy, id: @healthrecord
    end

    assert_redirected_to healthrecords_path
  end
end
