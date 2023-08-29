class Guest::Payload::ContactNumbersParser < ApplicationService
  attr_reader :airbnb_guest_contact_numbers, :booking_guest_contact_numbers

  def initialize(params)
    @airbnb_guest_contact_numbers = !params.dig(:guest, :phone).nil? ? [params[:guest][:phone]] : nil
    @booking_guest_contact_numbers = !params.dig(:reservation, :guest_phone_numbers).nil? ? params[:reservation][:guest_phone_numbers] : nil
  end

  def call
    airbnb_guest_contact_numbers || booking_guest_contact_numbers
  end
end
