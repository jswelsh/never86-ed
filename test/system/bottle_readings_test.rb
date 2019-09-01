require "application_system_test_case"

class BottleReadingsTest < ApplicationSystemTestCase
  setup do
    @bottle_reading = bottle_readings(:one)
  end

  test "visiting the index" do
    visit bottle_readings_url
    assert_selector "h1", text: "Bottle Readings"
  end

  test "creating a Bottle reading" do
    visit bottle_readings_url
    click_on "New Bottle Reading"

    fill_in "Bottle", with: @bottle_reading.bottle_id
    fill_in "Fill", with: @bottle_reading.fill
    fill_in "Reading time", with: @bottle_reading.reading_time
    fill_in "User", with: @bottle_reading.user_id
    click_on "Create Bottle reading"

    assert_text "Bottle reading was successfully created"
    click_on "Back"
  end

  test "updating a Bottle reading" do
    visit bottle_readings_url
    click_on "Edit", match: :first

    fill_in "Bottle", with: @bottle_reading.bottle_id
    fill_in "Fill", with: @bottle_reading.fill
    fill_in "Reading time", with: @bottle_reading.reading_time
    fill_in "User", with: @bottle_reading.user_id
    click_on "Update Bottle reading"

    assert_text "Bottle reading was successfully updated"
    click_on "Back"
  end

  test "destroying a Bottle reading" do
    visit bottle_readings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Bottle reading was successfully destroyed"
  end
end
