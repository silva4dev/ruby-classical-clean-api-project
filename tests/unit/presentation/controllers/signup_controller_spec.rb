# frozen_string_literal: true

require_relative "../../../../src/presentation/controllers/signup/signup_controller"
require_relative "../../../../src/presentation/errors/missing_param_error"
require_relative "../../../../src/presentation/errors/invalid_param_error"

describe Presentation::Controllers::Signup::SignupController, type: :unit do
  class EmailValidatorAdapterStub
    def is_valid?(email)
      return true
    end
  end

  def make_sut
    email_validator_adapter_stub = EmailValidatorAdapterStub.new
    return Presentation::Controllers::Signup::SignupController.new(email_validator_adapter_stub)
  end

  it "Should return 400 if required fields are not passed in the HTTP request body" do
    http_request = {
      body: {},
    }
    sut = make_sut()
    http_response = sut.handle(http_request)

    expect(http_response[:status_code]).to eq(400)
    expect(http_response[:body]).to be_instance_of(Presentation::Errors::MissingParamError)
  end

  it "Should return 400 if the password doesn't match the password confirmation" do
    http_request = {
      body: {
        name: "any_name",
        email: "any_email@mail.com",
        password: "any_password",
        password_confirmation: "any_password_confirmation",
      },
    }
    sut = make_sut()
    http_response = sut.handle(http_request)

    expect(http_response[:status_code]).to eq(400)
    expect(http_response[:body]).to eq(Presentation::Errors::InvalidParamError.new(:password_confirmation))
  end
end
