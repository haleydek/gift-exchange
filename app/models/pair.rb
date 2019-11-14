class Pair < ApplicationRecord
    belongs_to :event

    validates :gifter, :giftee, presence: true
end
