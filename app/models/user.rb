class User < ApplicationRecord
    has_many :assignments
    has_many :roles, through: :assignments
    has_many :events, through: :assignments

    has_secure_password

    validates :email, presence: true
    validates :email, uniqueness: true
end
