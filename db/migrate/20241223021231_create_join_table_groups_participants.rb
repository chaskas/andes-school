class CreateJoinTableGroupsParticipants < ActiveRecord::Migration[7.1]
  def change
    create_join_table :school_groups, :school_participants do |t|
      t.index [:school_group_id, :school_participant_id]
      t.index [:school_participant_id, :school_group_id]
    end
  end
end
