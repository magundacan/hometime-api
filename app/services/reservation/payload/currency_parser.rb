class Reservation::Payload::CurrencyParser < ApplicationService
  attr_reader :airbnb_reservation_currency, :booking_reservation_currency

  def initialize(params)
    @airbnb_reservation_currency = params.dig(:currency)
    @booking_reservation_currency = params.dig(:reservation, :host_currency)
  end

  def call
    airbnb_reservation_currency || booking_reservation_currency
  end
end
