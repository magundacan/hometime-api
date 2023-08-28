class Api::V1::ReservationsController < ApplicationController
  def create
    reservation = Reservation.build_with_guest(reservation_params, guest_params)

    if reservation.save_with_guest
      render json: reservation, status: :ok
    else
      render json: { errors: reservation.errors }, status: :unprocessable_entity
    end
  end

  private

  def reservation_params
  end

  def guest_params
  end
end
