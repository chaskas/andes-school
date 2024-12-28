class CreateJoinTableSchoolGroupsParticipants < ActiveRecord::Migration[7.1]
  def change
    create_table :school_groups_participants, id: false do |t|
      t.references :school_group, null: false, foreign_key: { to_table: :school_groups }
      t.references :school_participant, null: false, foreign_key: { to_table: :school_participants }
    end
  end
end
