module School
  class Participant < ApplicationRecord
    
    has_and_belongs_to_many :groups, class_name: "School::Group", join_table: "school_groups_participants", foreign_key: "school_participant_id", association_foreign_key: "school_group_id"

    validates :name, presence: true, format: { with: /\A[\p{L}\s]+\z/, message: "can only contain letters and spaces" }, length: { minimum: 2, maximum: 60 }
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "is not a valid email" }
    validates :birthday, presence: true
    validate :birthday_not_in_the_future
    validate :birthday_not_too_old

    def birthday_not_in_the_future
      if birthday.present? && birthday > Date.today
        errors.add(:birthday, "can't be in the future")
      end
    end

    def birthday_not_too_old
      if birthday.present? && birthday < 150.years.ago
        errors.add(:birthday, "can't be more than 150 years ago")
      end
    end

  end
end
