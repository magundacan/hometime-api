class Guest < ApplicationRecord
  has_many :reservations
  has_many :phone_numbers
end
