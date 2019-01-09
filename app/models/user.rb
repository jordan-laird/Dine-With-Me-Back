class User < ApplicationRecord
    has_secure_password
    has_many :meals
    has_many :invites
    # validations
end
