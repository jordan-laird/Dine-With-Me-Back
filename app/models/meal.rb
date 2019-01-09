class Meal < ApplicationRecord
    has_many :invites
    has_many :users, through: :invites
end
