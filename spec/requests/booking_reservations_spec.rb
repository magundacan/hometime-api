require 'rails_helper'

RSpec.describe "BookingReservations", type: :request do
  describe "POST /api/v1/reservations" do
    context "with valid parameters" do
      let(:valid_params) do
        {
          "reservation": {
            "code": "XXX12345678",
            "start_date": "2021-03-12",
            "end_date": "2021-03-16",
            "expected_payout_amount": "3800.00",
            "guest_details": {
              "localized_description": "4 guests",
              "number_of_adults": 2,
              "number_of_children": 2,
              "number_of_infants": 0
            },
            "guest_email": "wayne_woodbridge@bnb.com",
            "guest_first_name": "Wayne",
            "guest_last_name": "Woodbridge",
            "guest_phone_numbers": [
              "639123456789",
              "639123456789"
            ],
            "listing_security_price_accurate": "500.00",
            "host_currency": "AUD",
            "nights": 4,
            "number_of_guests": 4,
            "status_type": "accepted",
            "total_paid_amount_accurate": "4300.00"
          }
        }
      end

      it "creates a new reservation under a new guest" do
        expect { post "/api/v1/reservations", params: valid_params }.to change(Reservation, :count).by(+1).and \
                                                                        change(Guest,       :count).by(+1)

        json_response = JSON.parse(response.body).deep_symbolize_keys
        expect(json_response[:data][:attributes][:code]).to eq(valid_params[:reservation][:code])
        expect(json_response[:included][0][:attributes][:email]).to eq(valid_params[:reservation][:guest_email])

        expect(response).to have_http_status :ok
      end
    end
  end
end
