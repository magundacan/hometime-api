class ReservationSerializer
  include JSONAPI::Serializer
  attributes :code, :status, :start_date, :end_date, :number_of_nights,
             :number_of_guests, :number_of_adults, :number_of_children,
             :number_of_infants, :currency, :total_price_in_cents,
             :payout_price_in_cents, :security_price_in_cents,
             :created_at, :updated_at
  belongs_to :guest
end
