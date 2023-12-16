# frozen_string_literal: true

require_relative "../../../../src/presentation/controllers/signup/signup_controller"
require_relative "../../../../src/presentation/errors/missing_param_error"
require_relative "../../../../src/presentation/errors/invalid_param_error"

describe Presentation::Controllers::Signup::SignupController, type: :unit do
  it "Should return 400 if required fields are not passed in the HTTP request body" do
    http_request = {
      body: {},
    }
    sut = Presentation::Controllers::Signup::SignupController.new
    http_response = sut.handle(http_request)

    expect(http_response[:status_code]).to eq(400)
    expect(http_response[:body]).to be_instance_of(Presentation::Errors::MissingParamError)
  end

  it "Should return 400 if the password doesn't match the password confirmation" do
    http_request = {
      body: {
        name: "any_name",
        email: "any_email",
        password: "any_password",
        password_confirmation: "any_password_confirmation",
      },
    }
    sut = Presentation::Controllers::Signup::SignupController.new
    http_response = sut.handle(http_request)

    expect(http_response[:status_code]).to eq(400)
    expect(http_response[:body]).to eq(Presentation::Errors::InvalidParamError.new(:password_confirmation))
  end
end
