class Guest::Payload::Parser < ApplicationService
  attr_reader :params

  def initialize(params)
    @params = params
  end

  def call
    {
      email: EmailParser.call(params),
      first_name: FirstNameParser.call(params),
      last_name: LastNameParser.call(params)
    }
  end
end
