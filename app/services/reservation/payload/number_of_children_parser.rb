class Reservation::Payload::NumberOfChildrenParser < ApplicationService
  attr_reader :airbnb_reservation_number_of_children, :booking_reservation_number_of_children

  def initialize(params)
    @airbnb_reservation_number_of_children = params.dig(:children)
    @booking_reservation_number_of_children = params.dig(:reservation, :guest_details, :number_of_children)
  end

  def call
    airbnb_reservation_number_of_children || booking_reservation_number_of_children
  end
end
