class Reservation::Payload::NumberOfGuestsParser < ApplicationService
  attr_reader :airbnb_reservation_number_of_guests, :booking_reservation_number_of_guests

  def initialize(params)
    @airbnb_reservation_number_of_guests = params.dig(:guests)
    @booking_reservation_number_of_guests = params.dig(:reservation, :number_of_guests)
  end

  def call
    airbnb_reservation_number_of_guests || booking_reservation_number_of_guests
  end
end
