class Reservation::Payload::TotalPriceInCentsParser < ApplicationService
  attr_reader :airbnb_reservation_total_price_in_cents, :booking_reservation_total_price_in_cents

  def initialize(params)
    @airbnb_reservation_total_price_in_cents = convert_to_cents(params.dig(:total_price))
    @booking_reservation_total_price_in_cents = convert_to_cents(params.dig(:reservation, :total_paid_amount_accurate))
  end

  def call
    airbnb_reservation_total_price_in_cents || booking_reservation_total_price_in_cents
  end

  private

  def convert_to_cents(amount)
    return nil if amount.nil?
    amount.to_f * 100
  end
end
