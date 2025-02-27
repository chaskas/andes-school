# frozen_string_literal: true

require 'test_helper'

module School
  class GroupsControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @group = school_groups(:one)
      @group2 = Group.new(name: 'Test Group', description: 'This is a test group')
      @participant = Participant.new(name: 'Agustin Arturo Prat Chacon', email: 'capitan.prat.48@gmail.com',
                                     birthday: '1998-03-04')
    end

    test 'should get index' do
      get groups_url
      assert_response :success
    end

    test 'should get new' do
      get new_group_url
      assert_response :success
    end

    test 'should create group' do
      assert_difference('Group.count') do
        post groups_url, params: { group: { name: @group2.name, description: @group2.description } }
      end

      assert_redirected_to edit_group_path(Group.last)
    end

    test 'should show group' do
      get group_url(@group)
      assert_response :success
    end

    test 'should get edit' do
      get edit_group_url(@group)
      assert_response :success
    end

    test 'should update group' do
      patch group_url(@group), params: { group: { description: @group.description, name: @group.name } }
      assert_redirected_to group_url(@group)
    end

    test 'should destroy group' do
      assert_difference('Group.count', -1) do
        delete group_url(@group)
      end

      assert_redirected_to groups_url
    end

    test 'should add participant in the group' do
      assert_not @group.participants.include?(@participant)
      @participant.save
      post add_participant_group_url(@group), params: { participant_id: @participant.id }

      assert_redirected_to edit_group_path(@group)
      @group.reload
      assert_includes @group.participants, @participant
    end

    test 'should remove participant from the group' do
      @participant.save
      @group.participants << @participant

      assert_includes @group.participants, @participant

      delete remove_participant_group_url(@group), params: { participant_id: @participant.id }

      assert_redirected_to edit_group_path(@group)
      @group.reload
      assert_not_includes @group.participants, @participant
    end
  end
end
