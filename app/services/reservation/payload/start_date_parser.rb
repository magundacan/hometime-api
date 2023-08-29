class Reservation::Payload::StartDateParser < ApplicationService
  attr_reader :airbnb_reservation_start_date, :booking_reservation_start_date

  def initialize(params)
    @airbnb_reservation_start_date = params.dig(:start_date)
    @booking_reservation_start_date = params.dig(:reservation, :start_date)
  end

  def call
    airbnb_reservation_start_date || booking_reservation_start_date
  end
end
