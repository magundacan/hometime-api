class Reservation::Payload::CodeParser < ApplicationService
  attr_reader :airbnb_reservation_code, :booking_reservation_code

  def initialize(params)
    @airbnb_reservation_code = params.dig(:reservation_code)
    @booking_reservation_code = params.dig(:reservation, :code)
  end

  def call
    airbnb_reservation_code || booking_reservation_code
  end
end
