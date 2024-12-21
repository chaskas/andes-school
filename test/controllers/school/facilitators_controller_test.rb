require "test_helper"

module School
  class FacilitatorsControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @facilitator = school_facilitators(:one)
    end

    test "should get index" do
      get facilitators_url
      assert_response :success
    end

    test "should get new" do
      get new_facilitator_url
      assert_response :success
    end

    test "should create facilitator" do
      assert_difference("Facilitator.count") do
        post facilitators_url, params: { facilitator: { address: @facilitator.address, email: @facilitator.email, name: @facilitator.name, phone: @facilitator.phone } }
      end

      assert_redirected_to facilitator_url(Facilitator.last)
    end

    test "should show facilitator" do
      get facilitator_url(@facilitator)
      assert_response :success
    end

    test "should get edit" do
      get edit_facilitator_url(@facilitator)
      assert_response :success
    end

    test "should update facilitator" do
      patch facilitator_url(@facilitator), params: { facilitator: { address: @facilitator.address, email: @facilitator.email, name: @facilitator.name, phone: @facilitator.phone, birthday: @facilitator.birthday} }
      assert_redirected_to facilitator_url(@facilitator)
    end

    test "should destroy facilitator" do
      assert_difference("Facilitator.count", -1) do
        delete facilitator_url(@facilitator)
      end

      assert_redirected_to facilitators_url
    end
  end
end
