require 'test_helper'

class BottleReadingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bottle_reading = bottle_readings(:one)
  end

  test "should get index" do
    get bottle_readings_url
    assert_response :success
  end

  test "should get new" do
    get new_bottle_reading_url
    assert_response :success
  end

  test "should create bottle_reading" do
    assert_difference('BottleReading.count') do
      post bottle_readings_url, params: { bottle_reading: { bottle_id: @bottle_reading.bottle_id, fill: @bottle_reading.fill, reading_time: @bottle_reading.reading_time, user_id: @bottle_reading.user_id } }
    end

    assert_redirected_to bottle_reading_url(BottleReading.last)
  end

  test "should show bottle_reading" do
    get bottle_reading_url(@bottle_reading)
    assert_response :success
  end

  test "should get edit" do
    get edit_bottle_reading_url(@bottle_reading)
    assert_response :success
  end

  test "should update bottle_reading" do
    patch bottle_reading_url(@bottle_reading), params: { bottle_reading: { bottle_id: @bottle_reading.bottle_id, fill: @bottle_reading.fill, reading_time: @bottle_reading.reading_time, user_id: @bottle_reading.user_id } }
    assert_redirected_to bottle_reading_url(@bottle_reading)
  end

  test "should destroy bottle_reading" do
    assert_difference('BottleReading.count', -1) do
      delete bottle_reading_url(@bottle_reading)
    end

    assert_redirected_to bottle_readings_url
  end
end
