class Reservation::Payload::NumberOfAdultsParser < ApplicationService
  attr_reader :airbnb_reservation_number_of_adults, :booking_reservation_number_of_adults

  def initialize(params)
    @airbnb_reservation_number_of_adults = params.dig(:adults)
    @booking_reservation_number_of_adults = params.dig(:reservation, :guest_details, :number_of_adults)
  end

  def call
    airbnb_reservation_number_of_adults || booking_reservation_number_of_adults
  end
end
