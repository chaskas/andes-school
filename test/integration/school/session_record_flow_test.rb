require 'test_helper'

module School
  class SessionRecordFlowTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @session_detail = school_session_details(:one)
      # Mock the feature flag check to always return true for testing
      FeatureFlagService.stubs(:check_feature_flag).returns(true)
    end

    test "can create a session record through the form" do
      get edit_session_detail_path(@session_detail)
      assert_response :success
      assert_select "form[action=?]", session_detail_session_records_path(@session_detail)

      assert_difference('School::SessionRecord.count') do
        post session_detail_session_records_path(@session_detail), params: {
          session_record: {
            start_time: Time.current.strftime('%Y-%m-%dT%H:%M'),
            duration: 60
          }
        }, as: :turbo_stream
      end

      assert_response :success
      assert_equal 'text/vnd.turbo-stream.html', @response.media_type
    end

    test "can delete a session record" do
      # First create a session record
      session_record = @session_detail.session_records.create!(
        start_time: Time.current,
        duration: 45
      )

      # Now delete it using turbo_stream format
      assert_difference('School::SessionRecord.count', -1) do
        delete session_detail_session_record_path(@session_detail, session_record), as: :turbo_stream
      end

      assert_response :success
      assert_equal 'text/vnd.turbo-stream.html', @response.media_type
    end

  end
end
