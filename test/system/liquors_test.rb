require "application_system_test_case"

class LiquorsTest < ApplicationSystemTestCase
  setup do
    @liquor = liquors(:one)
  end

  test "visiting the index" do
    visit liquors_url
    assert_selector "h1", text: "Liquors"
  end

  test "creating a Liquor" do
    visit liquors_url
    click_on "New Liquor"

    fill_in "Brand", with: @liquor.brand
    fill_in "Capacity", with: @liquor.capacity
    fill_in "Cost", with: @liquor.cost
    fill_in "Name", with: @liquor.name
    fill_in "Spirit", with: @liquor.spirit
    click_on "Create Liquor"

    assert_text "Liquor was successfully created"
    click_on "Back"
  end

  test "updating a Liquor" do
    visit liquors_url
    click_on "Edit", match: :first

    fill_in "Brand", with: @liquor.brand
    fill_in "Capacity", with: @liquor.capacity
    fill_in "Cost", with: @liquor.cost
    fill_in "Name", with: @liquor.name
    fill_in "Spirit", with: @liquor.spirit
    click_on "Update Liquor"

    assert_text "Liquor was successfully updated"
    click_on "Back"
  end

  test "destroying a Liquor" do
    visit liquors_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Liquor was successfully destroyed"
  end
end
