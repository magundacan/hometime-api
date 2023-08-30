class Reservation < ApplicationRecord
  belongs_to :guest

  validates :code, uniqueness: true

  with_options presence: true do
    validates :code
    validates :status
    validates :start_date
    validates :end_date
    validates :currency
  end

  with_options numericality: { greater_than_or_equal_to: 0 } do
    validates :number_of_nights
    validates :number_of_guests
    validates :number_of_adults
    validates :number_of_children
    validates :number_of_infants
    validates :total_price_in_cents
    validates :payout_price_in_cents
    validates :security_price_in_cents
  end

  def self.build_with_guest(reservation_attributes, guest_attributes)
    reservation = Reservation.find_or_initialize_by(code: reservation_attributes[:code])
    guest       = Guest.find_or_initialize_by(email: guest_attributes[:email])

    reservation.assign_attributes(reservation_attributes)
    guest.assign_attributes(guest_attributes)

    reservation.guest = guest
    reservation
  end

  def save_with_guest
    transaction do
      save!
      guest.save!
    end
    true
  rescue ActiveRecord::RecordInvalid
    false
  end
end
