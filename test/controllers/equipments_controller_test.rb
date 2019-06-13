require 'test_helper'

class EquipmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @equipment = equipments(:one)
  end

  test "should get index" do
    get equipments_url
    assert_response :success
  end

  test "should get new" do
    get new_equipment_url
    assert_response :success
  end

  test "should create equipment" do
    assert_difference('Equipment.count') do
      post equipments_url, params: { equipment: { acquired_at: @equipment.acquired_at, additional_info: @equipment.additional_info, country_of_origin: @equipment.country_of_origin, dealer_id: @equipment.dealer_id, inventory_number: @equipment.inventory_number, location: @equipment.location, manufacturer: @equipment.manufacturer, model_name: @equipment.model_name, model_number: @equipment.model_number, name: @equipment.name, other_info: @equipment.other_info, serial_number: @equipment.serial_number, user_id: @equipment.user_id, warranty_period: @equipment.warranty_period } }
    end

    assert_redirected_to equipment_url(Equipment.last)
  end

  test "should show equipment" do
    get equipment_url(@equipment)
    assert_response :success
  end

  test "should get edit" do
    get edit_equipment_url(@equipment)
    assert_response :success
  end

  test "should update equipment" do
    patch equipment_url(@equipment), params: { equipment: { acquired_at: @equipment.acquired_at, additional_info: @equipment.additional_info, country_of_origin: @equipment.country_of_origin, dealer_id: @equipment.dealer_id, inventory_number: @equipment.inventory_number, location: @equipment.location, manufacturer: @equipment.manufacturer, model_name: @equipment.model_name, model_number: @equipment.model_number, name: @equipment.name, other_info: @equipment.other_info, serial_number: @equipment.serial_number, user_id: @equipment.user_id, warranty_period: @equipment.warranty_period } }
    assert_redirected_to equipment_url(@equipment)
  end

  test "should destroy equipment" do
    assert_difference('Equipment.count', -1) do
      delete equipment_url(@equipment)
    end

    assert_redirected_to equipments_url
  end
end
