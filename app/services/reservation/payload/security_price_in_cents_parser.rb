class Reservation::Payload::SecurityPriceInCentsParser < ApplicationService
  attr_reader :airbnb_reservation_security_price_in_cents, :booking_reservation_security_price_in_cents

  def initialize(params)
    @airbnb_reservation_security_price_in_cents = convert_to_cents(params.dig(:security_price))
    @booking_reservation_security_price_in_cents = convert_to_cents(params.dig(:reservation, :listing_security_price_accurate))
  end

  def call
    airbnb_reservation_security_price_in_cents || booking_reservation_security_price_in_cents
  end

  private

  def convert_to_cents(amount)
    return nil if amount.nil?
    amount.to_f * 100
  end
end
