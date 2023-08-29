class Guest::Payload::EmailParser < ApplicationService
  attr_reader :airbnb_guest_email, :booking_guest_email

  def initialize(params)
    @airbnb_guest_email = params.dig(:guest, :email)
    @booking_guest_email = params.dig(:reservation, :guest_email)
  end

  def call
    airbnb_guest_email || booking_guest_email
  end
end
