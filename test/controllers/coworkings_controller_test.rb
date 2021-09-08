# frozen_string_literal: true

require 'test_helper'

class CoworkingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @coworking = coworkings(:one)
  end

  test "should get index" do
    get coworkings_url
    assert_response :success
  end

  test "should get new" do
    get new_coworking_url
    assert_response :success
  end

  test "should create coworking" do
    assert_difference('Coworking.count') do
      post coworkings_url, params: { coworking: {} }
    end

    assert_redirected_to coworking_url(Coworking.last)
  end

  test "should show coworking" do
    get coworking_url(@coworking)
    assert_response :success
  end

  test "should get edit" do
    get edit_coworking_url(@coworking)
    assert_response :success
  end

  test "should update coworking" do
    patch coworking_url(@coworking), params: { coworking: {} }
    assert_redirected_to coworking_url(@coworking)
  end

  test "should destroy coworking" do
    assert_difference('Coworking.count', -1) do
      delete coworking_url(@coworking)
    end

    assert_redirected_to coworkings_url
  end
end
