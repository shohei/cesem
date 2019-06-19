equire 'test_helper'

class MaintenancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @maintenance = maintenances(:one)
  end

  test "should get index" do
    get maintenances_url
    assert_response :success
  end

  test "should get new" do
    get new_maintenance_url
    assert_response :success
  end

  test "should create maintenance" do
    assert_difference('Maintenance.count') do
      post maintenances_url, params: { maintenance: { completion_expected_at: @maintenance.completion_expected_at, description: @maintenance.description, diagnosis: @maintenance.diagnosis, equipment_id: @maintenance.equipment_id, other_status: @maintenance.other_status, precaution: @maintenance.precaution, recommission_projected_at: @maintenance.recommission_projected_at, scheduled_at: @maintenance.scheduled_at, status: @maintenance.status, trace_number: @maintenance.trace_number, user_id: @maintenance.user_id } }
    end

    assert_redirected_to maintenance_url(Maintenance.last)
  end

  test "should show maintenance" do
    get maintenance_url(@maintenance)
    assert_response :success
  end

  test "should get edit" do
    get edit_maintenance_url(@maintenance)
    assert_response :success
  end

  test "should update maintenance" do
    patch maintenance_url(@maintenance), params: { maintenance: { completion_expected_at: @maintenance.completion_expected_at, description: @maintenance.description, diagnosis: @maintenance.diagnosis, equipment_id: @maintenance.equipment_id, other_status: @maintenance.other_status, precaution: @maintenance.precaution, recommission_projected_at: @maintenance.recommission_projected_at, scheduled_at: @maintenance.scheduled_at, status: @maintenance.status, trace_number: @maintenance.trace_number, user_id: @maintenance.user_id } }
    assert_redirected_to maintenance_url(@maintenance)
  end

  test "should destroy maintenance" do
    assert_difference('Maintenance.count', -1) do
      delete maintenance_url(@maintenance)
    end

    assert_redirected_to maintenances_url
  end
end
