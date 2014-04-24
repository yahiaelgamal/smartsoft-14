require 'test_helper'

class HealthRecordsControllerTest < ActionController::TestCase
  setup do
    @health_record = health_records(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:health_records)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create health_record" do
    assert_difference('HealthRecord.count') do
      post :create, health_record: {  }
    end

    assert_redirected_to health_record_path(assigns(:health_record))
  end

  test "should show health_record" do
    get :show, id: @health_record
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @health_record
    assert_response :success
  end

  test "should update health_record" do
    put :update, id: @health_record, health_record: {  }
    assert_redirected_to health_record_path(assigns(:health_record))
  end

  test "should destroy health_record" do
    assert_difference('HealthRecord.count', -1) do
      delete :destroy, id: @health_record
    end

    assert_redirected_to health_records_path
  end
end
