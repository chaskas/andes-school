module School
  class SessionDetail < ApplicationRecord
    self.table_name = 'school_session_details'
    belongs_to :targetable, polymorphic: true, optional: true
    validates :targetable_type, presence: true
    validates :title, presence: true, length: { minimum: 2, maximum: 60 }
    validates :description, length: { maximum: 1000 }, allow_nil: true

    validate :targetable_type_matches_targetable

    private

    def targetable_type_matches_targetable
      return if targetable_id.nil? || targetable_type.nil?

      targetable_model = targetable_type.constantize
      return if targetable.is_a?(targetable_model)

      errors.add(:targetable, 'type mismatch')
    end
  end
end
