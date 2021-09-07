require "application_system_test_case"

class CoworkingsTest < ApplicationSystemTestCase
  setup do
    @coworking = coworkings(:one)
  end

  test "visiting the index" do
    visit coworkings_url
    assert_selector "h1", text: "Coworkings"
  end

  test "creating a Coworking" do
    visit coworkings_url
    click_on "New Coworking"

    click_on "Create Coworking"

    assert_text "Coworking was successfully created"
    click_on "Back"
  end

  test "updating a Coworking" do
    visit coworkings_url
    click_on "Edit", match: :first

    click_on "Update Coworking"

    assert_text "Coworking was successfully updated"
    click_on "Back"
  end

  test "destroying a Coworking" do
    visit coworkings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Coworking was successfully destroyed"
  end
end
