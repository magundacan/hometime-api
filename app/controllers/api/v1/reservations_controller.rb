class Api::V1::ReservationsController < ApplicationController
  def create
    reservation = Reservation.build_with_guest(reservation_params, guest_params)

    if reservation.save_with_guest
      render json: ReservationSerializer.new(reservation, { include: [:guest] }).serializable_hash,
             status: :ok
    else
      render json: { errors: reservation.errors.full_messages + reservation.guest.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  private

  def reservation_params
    @reservation_params ||= Reservation::Payload::Parser.call(params)
  end

  def guest_params
    @guest_params ||= Guest::Payload::Parser.call(params)
  end
end
