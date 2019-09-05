require 'test_helper'

class BottlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bottle = bottles(:one)
  end

  test "should get index" do
    get bottles_url
    assert_response :success
  end

  test "should get new" do
    get new_bottle_url
    assert_response :success
  end

  test "should create bottle" do
    assert_difference('Bottle.count') do
      post bottles_url, params: { bottle: { bar_id: @bottle.bar_id, liquor_id: @bottle.liquor_id } }
    end

    assert_redirected_to bottle_url(Bottle.last)
  end

  test "should show bottle" do
    get bottle_url(@bottle)
    assert_response :success
  end

  test "should get edit" do
    get edit_bottle_url(@bottle)
    assert_response :success
  end

  test "should update bottle" do
    patch bottle_url(@bottle), params: { bottle: { bar_id: @bottle.bar_id, liquor_id: @bottle.liquor_id } }
    assert_redirected_to bottle_url(@bottle)
  end

  test "should destroy bottle" do
    assert_difference('Bottle.count', -1) do
      delete bottle_url(@bottle)
    end

    assert_redirected_to bottles_url
  end
end
