module Guest::Payload
  class Parser < ApplicationService
    attr_reader :params
  
    def initialize(params)
      @params = params
    end
  
    def call
      {
        email: EmailParser.call(params),
        first_name: FirstNameParser.call(params),
        last_name: LastNameParser.call(params),
        contact_numbers: ContactNumbersParser.call(params)
      }.compact
    end
  end
end
