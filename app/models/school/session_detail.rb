module School
  class SessionDetail < ApplicationRecord
    self.table_name = 'school_session_details'
    belongs_to :targetable, polymorphic: true, optional: true
    validates :targetable_type, presence: true
    validates :title, presence: true, length: { minimum: 2, maximum: 60 }
  end
end