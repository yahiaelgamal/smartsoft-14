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
      post :create, healthrecord: { bmi: @healthrecord.bmi, calcium_per_day: @healthrecord.calcium_per_day, calcium_till_now: @healthrecord.calcium_till_now, carbohydrate_per_day: @healthrecord.carbohydrate_per_day, carbohydrate_till_now: @healthrecord.carbohydrate_till_now, fat_per_day: @healthrecord.fat_per_day, fat_till_now: @healthrecord.fat_till_now, fats: @healthrecord.fats, height: @healthrecord.height, name: @healthrecord.name, program: @healthrecord.program, protein_per_day: @healthrecord.protein_per_day, protein_till_now: @healthrecord.protein_till_now, weight: @healthrecord.weight }
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
    put :update, id: @healthrecord, healthrecord: { bmi: @healthrecord.bmi, calcium_per_day: @healthrecord.calcium_per_day, calcium_till_now: @healthrecord.calcium_till_now, carbohydrate_per_day: @healthrecord.carbohydrate_per_day, carbohydrate_till_now: @healthrecord.carbohydrate_till_now, fat_per_day: @healthrecord.fat_per_day, fat_till_now: @healthrecord.fat_till_now, fats: @healthrecord.fats, height: @healthrecord.height, name: @healthrecord.name, program: @healthrecord.program, protein_per_day: @healthrecord.protein_per_day, protein_till_now: @healthrecord.protein_till_now, weight: @healthrecord.weight }
    assert_redirected_to healthrecord_path(assigns(:healthrecord))
  end

  test "should destroy healthrecord" do
    assert_difference('Healthrecord.count', -1) do
      delete :destroy, id: @healthrecord
    end

    assert_redirected_to healthrecords_path
  end
end
