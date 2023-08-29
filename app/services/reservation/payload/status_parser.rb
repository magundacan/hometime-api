class Reservation::Payload::StatusParser < ApplicationService
  attr_reader :airbnb_reservation_status, :booking_reservation_status

  def initialize(params)
    @airbnb_reservation_status = params.dig(:status)
    @booking_reservation_status = params.dig(:reservation, :status_type)
  end

  def call
    airbnb_reservation_status || booking_reservation_status
  end
end
