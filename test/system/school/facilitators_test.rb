require "application_system_test_case"

module School
  class FacilitatorsTest < ApplicationSystemTestCase
    setup do
      @facilitator = school_facilitators(:one)
    end

    test "visiting the index" do
      visit facilitators_url
      assert_selector "h1", text: "Facilitators"
    end

    test "should create facilitator" do
      visit facilitators_url
      click_on "New facilitator"

      fill_in "Address", with: @facilitator.address
      fill_in "Email", with: @facilitator.email
      fill_in "Name", with: @facilitator.name
      fill_in "Phone", with: @facilitator.phone
      click_on "Create Facilitator"

      assert_text "Facilitator was successfully created"
      click_on "Back"
    end

    test "should update Facilitator" do
      visit facilitator_url(@facilitator)
      click_on "Edit this facilitator", match: :first

      fill_in "Address", with: @facilitator.address
      fill_in "Email", with: @facilitator.email
      fill_in "Name", with: @facilitator.name
      fill_in "Phone", with: @facilitator.phone
      click_on "Update Facilitator"

      assert_text "Facilitator was successfully updated"
      click_on "Back"
    end

    test "should destroy Facilitator" do
      visit facilitator_url(@facilitator)
      click_on "Destroy this facilitator", match: :first

      assert_text "Facilitator was successfully destroyed"
    end
  end
end
