class Reservation::Payload::EndDateParser < ApplicationService
  attr_reader :airbnb_reservation_end_date, :booking_reservation_end_date

  def initialize(params)
    @airbnb_reservation_end_date = params.dig(:end_date)
    @booking_reservation_end_date = params.dig(:reservation, :end_date)
  end

  def call
    airbnb_reservation_end_date || booking_reservation_end_date
  end
end
