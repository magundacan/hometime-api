class Reservation::Payload::NumberOfInfantsParser < ApplicationService
  attr_reader :airbnb_reservation_number_of_infants, :booking_reservation_number_of_infants

  def initialize(params)
    @airbnb_reservation_number_of_infants = params.dig(:infants)
    @booking_reservation_number_of_infants = params.dig(:reservation, :guest_details, :number_of_infants)
  end

  def call
    airbnb_reservation_number_of_infants || booking_reservation_number_of_infants
  end
end
