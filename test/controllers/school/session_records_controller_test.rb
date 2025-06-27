require 'test_helper'

module School
  class SessionRecordsControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @session_detail = school_session_details(:one)
      @session_record = school_session_records(:one)
      # Mock the feature flag check to always return true for testing
      FeatureFlagService.stubs(:check_feature_flag).returns(true)
    end

    test "should create session_record" do
      assert_difference('School::SessionRecord.count') do
        post session_detail_session_records_path(@session_detail), params: {
          session_record: {
            start_time: Time.current,
            duration: 60
          }
        }, as: :turbo_stream
      end

      assert_response :success
      assert_equal 'text/vnd.turbo-stream.html', @response.media_type
    end

    test "should not create session_record with invalid attributes" do
      assert_no_difference('School::SessionRecord.count') do
        post session_detail_session_records_path(@session_detail), params: {
          session_record: {
            start_time: nil,
            duration: nil
          }
        }, as: :turbo_stream
      end

      assert_response :success
      assert_equal 'text/vnd.turbo-stream.html', @response.media_type
    end

    test "should destroy session_record" do
      assert_difference('School::SessionRecord.count', -1) do
        delete session_detail_session_record_path(@session_detail, @session_record), as: :turbo_stream
      end

      assert_response :success
      assert_equal 'text/vnd.turbo-stream.html', @response.media_type
    end
  end
end
