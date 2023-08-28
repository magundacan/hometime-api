class Reservation::Payload::Parser < ApplicationService
  attr_reader :params

  def initialize(params)
    @params = params
  end

  def call
    {
      code: CodeParser.call(params),
      status: StatusParser.call(params),
      start_date: StartDateParser.call(params),
      end_date: EndDateParser.call(params),
      number_of_nights: NumberOfNightsParser.call(params),
      number_of_guests: NumberOfGuestsParser.call(params),
      number_of_adults: NumberOfAdultsParser.call(params),
      number_of_children: NumberOfChildrenParser.call(params),
      number_of_infants: NumberOfInfantsParser.call(params),
      total_price_in_cents: TotalPriceInCentsParser.call(params),
      payout_price_in_cents: PayoutPriceInCentsParser.call(params),
      security_price_in_cents: SecurityPriceInCentsParser.call(params),
      currency: CurrencyParser.call(params)
    }
  end
end
