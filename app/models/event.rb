class Event < ApplicationRecord
    has_many :assignments
    has_many :users, through: :assignments
    has_many :roles, through: :assignments
    has_many :pairs

    validates :name, presence: true
    validates :event_cannot_start_in_the_past, :event_cannot_end_before_it_starts, :event_with_end_datetime_requires_start_datetime
    
    def event_cannot_start_in_the_past
        if start_datetime.present? && start_datetime < Date.today
            errors.add(:start_datetime, "cannot be in the past")
        end
    end

    def event_cannot_end_before_it_starts
        if start_datetime.present? && end_datetime.present?
            if end_datetime < start_datetime
                errors.add(:end_datetime, "cannot be before event starts")
            end
        end
    end

    def event_with_end_datetime_requires_start_datetime
        if end_datetime.present? && !start_datetime.present?
            errors.add(:start_datetime, "cannot be blank when end date/time is entered")
        end
    end

    def spend_limit_must_be_positive
        if spend_limit.present? && spend_limit <= 0
            errors.add(:spend_limit, "cannot be less than or equal to zero")
        end
    end

end
