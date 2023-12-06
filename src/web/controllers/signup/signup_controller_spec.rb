# frozen_string_literal: true

require_relative './signup_controller'

describe Web::Controllers::Signup::SignupController, type: :controller do
  it 'should return 400 if required fields are not passed in the HTTP request body' do
    sut = Web::Controllers::Signup::SignupController.new

    http_request = {
      body: {
        read: {}
      }
    }

    http_response = sut.call(http_request)
    expect(http_response[:statusCode]).to eq(400)
    expect(http_response[:body]).to eq(StandardError.new)
  end
end
