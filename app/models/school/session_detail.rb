module School
  class SessionDetail < ApplicationRecord
    self.table_name = 'school_session_details'
    belongs_to :targetable, polymorphic: true, optional: true
  end
end