class Reservation < ApplicationRecord
  belongs_to :guest

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
