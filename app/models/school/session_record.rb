# frozen_string_literal: true

module School
  class SessionRecord < School::ApplicationRecord
    belongs_to :session_detail

    validates :start_time, presence: true
    validates :duration, presence: true, numericality: { only_integer: true, greater_than: 0 }
  end
end
