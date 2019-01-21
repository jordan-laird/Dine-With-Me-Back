class Meal < ApplicationRecord
    has_many :invites
    has_many :users, through: :invites
    accepts_nested_attributes_for :invites
end
