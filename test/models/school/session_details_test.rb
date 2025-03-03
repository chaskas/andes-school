require "test_helper"

module School
  class SessionDetailTest < ActiveSupport::TestCase
    def setup
      @session_detail_group = School::SessionDetail.new(
        targetable_type: "School::Group",
        title: "Session Detail Group",
        description: "This is a test description for a group."
      )
      @session_detail_participant = School::SessionDetail.new(
        targetable_type: "School::Participant",
        title: "Session Detail Participant",
        description: "This is a test description for a participant."
      )
    end

    test "session detail group should be valid" do
      assert @session_detail_group.valid?
    end

    test "session detail participant should be valid" do
      assert @session_detail_participant.valid?
    end

    test "targetable_type should be present" do
      session_detail = School::SessionDetail.new(title: "Test")
      session_detail.targetable_type = nil
      assert_not session_detail.valid?
    end

    test "title should be present" do
      session_detail = School::SessionDetail.new(targetable_type: "School::Group")
      session_detail.title = nil
      assert_not session_detail.valid?
    end

    test "title should have minimum length of 2" do
      session_detail = School::SessionDetail.new(targetable_type: "School::Group", title: "a")
      assert_not session_detail.valid?
    end

    test "title should have maximum length of 60" do
      session_detail = School::SessionDetail.new(targetable_type: "School::Group", title: "a" * 61)
      assert_not session_detail.valid?
    end

    # test "belongs_to targetable, polymorphic, optional" do
    #   assert_respond_to @session_detail_group, :targetable
    #   assert_respond_to @session_detail_group, :targetable_type
    #   assert_respond_to @session_detail_group, :targetable_id
    # end

    # test "targetable can be nil" do
    #   session_detail = School::SessionDetail.new(targetable_type: "School::Group", title: "Test")
    #   session_detail.targetable = nil
    #   assert session_detail.valid?
    # end

    test "targetable can be associated with a group" do
      group = School::Group.create!(name: "Test Group")
      @session_detail_group.targetable = group
      assert @session_detail_group.valid?
      assert_equal group, @session_detail_group.targetable
    end

    test "targetable can be associated with a participant" do
      participant = School::Participant.create!(
        name: "Arturo Prat",
        email: "arturo.prat@gmail.com",
        birthday: Date.new(1990, 1, 1)
      )
      @session_detail_participant.targetable = participant
      assert @session_detail_participant.valid?
      assert_equal participant, @session_detail_participant.targetable
    end

    test "description can be present" do
      assert_not_nil @session_detail_group.description
      assert_not_nil @session_detail_participant.description
    end

    test "description can be nil" do
      session_detail = School::SessionDetail.new(targetable_type: "School::Group", title: "Test")
      assert_nil session_detail.description
    end

    test "description can be a long text within limit" do
      long_description = "a" * 1000
      session_detail = School::SessionDetail.new(targetable_type: "School::Group", title: "Test", description: long_description)
      assert_equal long_description, session_detail.description
      assert session_detail.valid?
    end

    test "description should not be longer than limit" do
      long_description = "a" * 1001
      session_detail = School::SessionDetail.new(targetable_type: "School::Group", title: "Test", description: long_description)
      assert_not session_detail.valid?
    end

    test "targetable_type cannot be nil" do
      session_detail = School::SessionDetail.new(title: "Test")
      session_detail.targetable_type = nil
      assert_not session_detail.valid?
    end

    test "targetable_id can be nil" do
      session_detail = School::SessionDetail.new(targetable_type: "School::Group", title: "Test")
      session_detail.targetable_id = nil
      assert session_detail.valid?
    end

    test "targetable type mismatch group" do
      participant = School::Participant.create!(
        name: "Test Participant",
        email: "test.participant@example.com",
        birthday: Date.new(1990, 1, 1)
      )
      session_detail = School::SessionDetail.new(targetable_type: "School::Group", title: "Test", targetable_id: participant.id)
      assert_not session_detail.valid?
    end

    test "targetable type mismatch participant" do
      group = School::Group.create!(name: "Test Group")
      session_detail = School::SessionDetail.new(targetable_type: "School::Participant", title: "Test", targetable_id: group.id)
      assert_not session_detail.valid?
    end

  end
end