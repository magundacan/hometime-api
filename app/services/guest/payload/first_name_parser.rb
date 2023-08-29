class Guest::Payload::FirstNameParser < ApplicationService
  attr_reader :airbnb_guest_first_name, :booking_guest_first_name

  def initialize(params)
    @airbnb_guest_first_name = params.dig(:guest, :first_name)
    @booking_guest_first_name = params.dig(:reservation, :guest_first_name)
  end

  def call
    airbnb_guest_first_name || booking_guest_first_name
  end
end
