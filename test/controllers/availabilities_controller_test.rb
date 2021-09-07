require 'test_helper'

class AvailabilitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @availability = availabilities(:one)
  end

  test "should get index" do
    get availabilities_url
    assert_response :success
  end

  test "should get new" do
    get new_availability_url
    assert_response :success
  end

  test "should create availability" do
    assert_difference('Availability.count') do
      post availabilities_url, params: { availability: {  } }
    end

    assert_redirected_to availability_url(Availability.last)
  end

  test "should show availability" do
    get availability_url(@availability)
    assert_response :success
  end

  test "should get edit" do
    get edit_availability_url(@availability)
    assert_response :success
  end

  test "should update availability" do
    patch availability_url(@availability), params: { availability: {  } }
    assert_redirected_to availability_url(@availability)
  end

  test "should destroy availability" do
    assert_difference('Availability.count', -1) do
      delete availability_url(@availability)
    end

    assert_redirected_to availabilities_url
  end
end
