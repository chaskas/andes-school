class AddBirthdayToSchoolParticipants < ActiveRecord::Migration[7.1]
  def change
    add_column :school_participants, :birthday, :datetime
  end
end
