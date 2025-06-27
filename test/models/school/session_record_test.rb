require 'test_helper'

module School
  class SessionRecordTest < ActiveSupport::TestCase
    setup do
      @session_detail = School::SessionDetail.create!(
        title: "Test Session",
        description: "Test Description",
        targetable_type: "School::Group"
      )
    end

    test "should be valid with all required attributes" do
      session_record = @session_detail.session_records.new(
        start_time: Time.current,
        duration: 60
      )
      assert session_record.valid?
    end

    test "should not be valid without start_time" do
      session_record = @session_detail.session_records.new(duration: 60)
      assert_not session_record.valid?
      assert_includes session_record.errors[:start_time], "can't be blank"
    end

    test "should not be valid without duration" do
      session_record = @session_detail.session_records.new(start_time: Time.current)
      assert_not session_record.valid?
      assert_includes session_record.errors[:duration], "can't be blank"
    end

    test "should not be valid with non-integer duration" do
      session_record = @session_detail.session_records.new(
        start_time: Time.current,
        duration: 'abc'
      )
      assert_not session_record.valid?
      assert_includes session_record.errors[:duration], "is not a number"
    end

    test "should not be valid with zero or negative duration" do
      session_record = @session_detail.session_records.new(
        start_time: Time.current,
        duration: 0
      )
      assert_not session_record.valid?
      assert_includes session_record.errors[:duration], "must be greater than 0"

      session_record.duration = -10
      assert_not session_record.valid?
      assert_includes session_record.errors[:duration], "must be greater than 0"
    end

    test "should belong to session_detail" do
      session_record = School::SessionRecord.new
      assert_respond_to session_record, :session_detail
    end

    test "should be destroyed when session_detail is destroyed" do
      session_record = @session_detail.session_records.create!(
        start_time: Time.current,
        duration: 60
      )

      assert_difference('School::SessionRecord.count', -1) do
        @session_detail.destroy
      end
    end
  end
end
