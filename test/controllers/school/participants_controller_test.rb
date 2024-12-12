require "test_helper"

module School
  class ParticipantsControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @participant = school_participants(:young)
    end

    test "should get index" do
      get participants_url
      assert_response :success
    end

    test "should get new" do
      get new_participant_url
      assert_response :success
    end

    test "should create participant" do
      assert_difference("Participant.count") do
        post participants_url, params: { participant: { email: @participant.email, name: @participant.name, birthday: @participant.birthday } }
      end

      assert_redirected_to participant_url(Participant.last)
    end

    test "should not create participant if is older than 150 years" do

      @super_old_participant = school_participants(:dead)

      assert_no_difference("Participant.count") do
        post participants_url, params: { participant: { email: @super_old_participant.email, name: @super_old_participant.name, birthday: @super_old_participant.birthday } }
      end

      assert_response :unprocessable_entity
    end

    test "should show participant" do
      get participant_url(@participant)
      assert_response :success
    end

    test "should get edit" do
      get edit_participant_url(@participant)
      assert_response :success
    end

    test "should update participant" do
      patch participant_url(@participant), params: { participant: { email: @participant.email, name: @participant.name, birthday: @participant.birthday } }
      assert_redirected_to @participant
    end

    test "should destroy participant" do
      assert_difference("Participant.count", -1) do
        delete participant_url(@participant)
      end

      assert_redirected_to participants_url
    end
  end
end
