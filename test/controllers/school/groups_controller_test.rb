require "test_helper"

module School
  class GroupsControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @group = school_groups(:one)
      @group2 = Group.new(name: "Test Group", description: "This is a test group")
    end

    test "should get index" do
      get groups_url
      assert_response :success
    end

    test "should get new" do
      get new_group_url
      assert_response :success
    end

    test "should create group" do
      assert_difference("Group.count") do
        post groups_url, params: { group: { name: @group2.name, description: @group2.description } }
      end

      assert_redirected_to group_url(Group.last)
    end

    test "should show group" do
      get group_url(@group)
      assert_response :success
    end

    test "should get edit" do
      get edit_group_url(@group)
      assert_response :success
    end

    test "should update group" do
      patch group_url(@group), params: { group: { description: @group.description, name: @group.name } }
      assert_redirected_to group_url(@group)
    end

    test "should destroy group" do
      assert_difference("Group.count", -1) do
        delete group_url(@group)
      end

      assert_redirected_to groups_url
    end
  end
end
