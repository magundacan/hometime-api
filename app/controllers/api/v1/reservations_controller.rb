class Api::V1::ReservationsController < ApplicationController
  def create
    reservation = Reservation.new(reservation_params)

    if reservation.save
      render json: reservation, status: :created
    else
      render json: { errors: reservation.errors }, status: :unprocessable_entity
    end
  end

  private

  def reservation_params
  end
end
