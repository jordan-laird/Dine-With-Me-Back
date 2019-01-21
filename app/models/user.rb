class User < ApplicationRecord
    has_secure_password
    has_one_attached :avatar 
    has_many :meals
    has_many :invites
    # validations
end
