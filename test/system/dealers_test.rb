require "application_system_test_case"

class DealersTest < ApplicationSystemTestCase
  setup do
    @dealer = dealers(:one)
  end

  test "visiting the index" do
    visit dealers_url
    assert_selector "h1", text: "Dealers"
  end

  test "creating a Dealer" do
    visit dealers_url
    click_on "New Dealer"

    fill_in "Address", with: @dealer.address
    fill_in "Contact person name", with: @dealer.contact_person_name
    fill_in "Name", with: @dealer.name
    fill_in "Phone number", with: @dealer.phone_number
    click_on "Create Dealer"

    assert_text "Dealer was successfully created"
    click_on "Back"
  end

  test "updating a Dealer" do
    visit dealers_url
    click_on "Edit", match: :first

    fill_in "Address", with: @dealer.address
    fill_in "Contact person name", with: @dealer.contact_person_name
    fill_in "Name", with: @dealer.name
    fill_in "Phone number", with: @dealer.phone_number
    click_on "Update Dealer"

    assert_text "Dealer was successfully updated"
    click_on "Back"
  end

  test "destroying a Dealer" do
    visit dealers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Dealer was successfully destroyed"
  end
end
