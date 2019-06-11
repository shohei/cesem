require 'test_helper'

class DealersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dealer = dealers(:one)
  end

  test "should get index" do
    get dealers_url
    assert_response :success
  end

  test "should get new" do
    get new_dealer_url
    assert_response :success
  end

  test "should create dealer" do
    assert_difference('Dealer.count') do
      post dealers_url, params: { dealer: { address: @dealer.address, contact_person_name: @dealer.contact_person_name, name: @dealer.name, phone_number: @dealer.phone_number } }
    end

    assert_redirected_to dealer_url(Dealer.last)
  end

  test "should show dealer" do
    get dealer_url(@dealer)
    assert_response :success
  end

  test "should get edit" do
    get edit_dealer_url(@dealer)
    assert_response :success
  end

  test "should update dealer" do
    patch dealer_url(@dealer), params: { dealer: { address: @dealer.address, contact_person_name: @dealer.contact_person_name, name: @dealer.name, phone_number: @dealer.phone_number } }
    assert_redirected_to dealer_url(@dealer)
  end

  test "should destroy dealer" do
    assert_difference('Dealer.count', -1) do
      delete dealer_url(@dealer)
    end

    assert_redirected_to dealers_url
  end
end
