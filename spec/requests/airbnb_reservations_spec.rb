require 'rails_helper'

RSpec.describe "AirbnbReservations", type: :request do
  describe "POST /api/v1/reservations" do
    context "with valid parameters" do
      let(:valid_params) do
        {
          "reservation_code": "YYY12345678",
          "start_date": "2021-04-14",
          "end_date": "2021-04-18",
          "nights": 4,
          "guests": 4,
          "adults": 2,
          "children": 2,
          "infants": 0,
          "status": "accepted",
          "guest": {
            "first_name": "Wayne",
            "last_name": "Woodbridge",
            "phone": "639123456789",
            "email": "wayne_woodbridge@bnb.com"
          },
          "currency": "AUD",
          "payout_price": "4200.00",
          "security_price": "500",
          "total_price": "4700.00"
        }
      end

      it "creates a new reservation under a new guest" do
        expect { post "/api/v1/reservations", params: valid_params }.to change(Reservation, :count).by(+1).and \
                                                                        change(Guest,       :count).by(+1)

        json_response = JSON.parse(response.body).deep_symbolize_keys
        expect(json_response[:data][:attributes][:code]).to eq(valid_params[:reservation_code])
        expect(json_response[:included][0][:attributes][:email]).to eq(valid_params[:guest][:email])

        expect(response).to have_http_status :ok
      end
    end
  end
end
