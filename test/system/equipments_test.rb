require "application_system_test_case"

class EquipmentsTest < ApplicationSystemTestCase
  setup do
    @equipment = equipments(:one)
  end

  test "visiting the index" do
    visit equipments_url
    assert_selector "h1", text: "Equipments"
  end

  test "creating a Equipment" do
    visit equipments_url
    click_on "New Equipment"

    fill_in "Acquired at", with: @equipment.acquired_year
    fill_in "Additional info", with: @equipment.additional_info
    fill_in "Country of origin", with: @equipment.country_of_origin
    fill_in "Dealer", with: @equipment.dealer_id
    fill_in "Inventory number", with: @equipment.inventory_number
    fill_in "Location", with: @equipment.location
    fill_in "Manufacturer", with: @equipment.manufacturer
    fill_in "Model name", with: @equipment.name_of_model
    fill_in "Model number", with: @equipment.model_number
    fill_in "Name", with: @equipment.name
    fill_in "Other info", with: @equipment.other_info
    fill_in "Serial number", with: @equipment.serial_number
    fill_in "User", with: @equipment.user_id
    fill_in "Warranty period", with: @equipment.warranty_period
    click_on "Create Equipment"

    assert_text "Equipment was successfully created"
    click_on "Back"
  end

  test "updating a Equipment" do
    visit equipments_url
    click_on "Edit", match: :first

    fill_in "Acquired at", with: @equipment.acquired_year
    fill_in "Additional info", with: @equipment.additional_info
    fill_in "Country of origin", with: @equipment.country_of_origin
    fill_in "Dealer", with: @equipment.dealer_id
    fill_in "Inventory number", with: @equipment.inventory_number
    fill_in "Location", with: @equipment.location
    fill_in "Manufacturer", with: @equipment.manufacturer
    fill_in "Model name", with: @equipment.name_of_model
    fill_in "Model number", with: @equipment.model_number
    fill_in "Name", with: @equipment.name
    fill_in "Other info", with: @equipment.other_info
    fill_in "Serial number", with: @equipment.serial_number
    fill_in "User", with: @equipment.user_id
    fill_in "Warranty period", with: @equipment.warranty_period
    click_on "Update Equipment"

    assert_text "Equipment was successfully updated"
    click_on "Back"
  end

  test "destroying a Equipment" do
    visit equipments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Equipment was successfully destroyed"
  end
end
