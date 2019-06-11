require "application_system_test_case"

class MaintenancesTest < ApplicationSystemTestCase
  setup do
    @maintenance = maintenances(:one)
  end

  test "visiting the index" do
    visit maintenances_url
    assert_selector "h1", text: "Maintenances"
  end

  test "creating a Maintenance" do
    visit maintenances_url
    click_on "New Maintenance"

    fill_in "Completion expected at", with: @maintenance.completion_expected_at
    fill_in "Description", with: @maintenance.description
    fill_in "Diagnosis", with: @maintenance.diagnosis
    fill_in "Equipment", with: @maintenance.equipment_id
    fill_in "Other status", with: @maintenance.other_status
    fill_in "Precaution", with: @maintenance.precaution
    fill_in "Recomission projected at", with: @maintenance.recomission_projected_at
    fill_in "Scheduled at", with: @maintenance.scheduled_at
    fill_in "Status", with: @maintenance.status
    fill_in "Trace number", with: @maintenance.trace_number
    fill_in "User", with: @maintenance.user_id
    click_on "Create Maintenance"

    assert_text "Maintenance was successfully created"
    click_on "Back"
  end

  test "updating a Maintenance" do
    visit maintenances_url
    click_on "Edit", match: :first

    fill_in "Completion expected at", with: @maintenance.completion_expected_at
    fill_in "Description", with: @maintenance.description
    fill_in "Diagnosis", with: @maintenance.diagnosis
    fill_in "Equipment", with: @maintenance.equipment_id
    fill_in "Other status", with: @maintenance.other_status
    fill_in "Precaution", with: @maintenance.precaution
    fill_in "Recomission projected at", with: @maintenance.recomission_projected_at
    fill_in "Scheduled at", with: @maintenance.scheduled_at
    fill_in "Status", with: @maintenance.status
    fill_in "Trace number", with: @maintenance.trace_number
    fill_in "User", with: @maintenance.user_id
    click_on "Update Maintenance"

    assert_text "Maintenance was successfully updated"
    click_on "Back"
  end

  test "destroying a Maintenance" do
    visit maintenances_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Maintenance was successfully destroyed"
  end
end
