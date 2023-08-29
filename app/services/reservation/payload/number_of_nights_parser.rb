class Reservation::Payload::NumberOfNightsParser < ApplicationService
  attr_reader :airbnb_reservation_number_of_nights, :booking_reservation_number_of_nights

  def initialize(params)
    @airbnb_reservation_number_of_nights = params.dig(:nights)
    @booking_reservation_number_of_nights = params.dig(:reservation, :nights)
  end

  def call
    airbnb_reservation_number_of_nights || booking_reservation_number_of_nights
  end
end
