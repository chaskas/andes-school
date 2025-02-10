module School
  class Group < ApplicationRecord
    has_and_belongs_to_many :participants, class_name: 'School::Participant', join_table: 'school_groups_participants',
                                           foreign_key: 'school_group_id', association_foreign_key: 'school_participant_id'
    has_many :session_details, as: :targetable
    validates :name, presence: true, uniqueness: true
  end
end
