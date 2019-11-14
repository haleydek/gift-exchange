class Role < ApplicationRecord
    has_many :assignments
    has_many :users, through: :assignments
    has_many :events, through: :assignments

    validates :name, presence: true
    validates :name, uniqueness: true
end
