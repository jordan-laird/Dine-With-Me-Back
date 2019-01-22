class User < ApplicationRecord
    has_secure_password
    has_one_attached :avatar 
    has_many :meals
    has_many :invites
    has_many :users, through: :invites
    has_many :messages
    has_many :users, through: :messages
    # validations
end
