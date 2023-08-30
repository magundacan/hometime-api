class Guest < ApplicationRecord
  has_many :reservations

  validates :email, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  with_options presence: true do
    validates :email
    validates :first_name
    validates :last_name
    validates :contact_numbers
  end
end
