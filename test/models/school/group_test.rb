require "test_helper"

module School
  class GroupTest < ActiveSupport::TestCase

    def setup
      @group = School::Group.new(
        name: "Group Testing",
        description: "This is a test group"
      )
    end

    test "should save valid group" do
      assert @group.save, "Failed to save a valid group"
    end

    test "should not save group without name" do
      @group.name = nil
      assert_not @group.save, "Saved the group without a name"
    end

    test "should not save group with empty name" do
      @group.name = ""
      assert_not @group.save, "Saved the group with an empty name"
    end

    test "should not save group with duplicate name" do
      School::Group.create!(name: "Group A", description: "Original group")
      duplicate_group = School::Group.new(name: "Group A", description: "Duplicate group")
      assert_not duplicate_group.save, "Saved the group with a duplicate name"
    end

  end
end
