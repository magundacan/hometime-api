class Guest::Payload::LastNameParser < ApplicationService
  attr_reader :airbnb_guest_last_name, :booking_guest_last_name

  def initialize(params)
    @airbnb_guest_last_name = params.dig(:guest, :last_name)
    @booking_guest_last_name = params.dig(:reservation, :guest_last_name)
  end

  def call
    airbnb_guest_last_name || booking_guest_last_name
  end
end
