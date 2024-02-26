# frozen_string_literal: true

require_relative '../../../../src/presentation/controllers/signup/signup_controller'
require_relative '../../../../src/presentation/errors/missing_param_error'
require_relative '../../../../src/presentation/errors/invalid_param_error'
require_relative '../../../../src/validation/email_validator/email_validator_adapter'

describe SignupController, type: :unit do
  def make_sut
    email_validator_adapter = EmailValidatorAdapter.new
    sut = SignupController.new(email_validator_adapter)
    { sut:, email_validator_adapter: }
  end

  it 'Should return 400 if required fields are not passed in the HTTP request body' do
    http_request = {
      body: {}
    }
    sut = make_sut.fetch(:sut)
    http_response = sut.handle(http_request)

    expect(http_response[:status_code]).to eq(400)
    expect(http_response[:body]).to be_instance_of(MissingParamError)
  end

  it "Should return 400 if the password doesn't match the password confirmation" do
    http_request = {
      body: {
        name: 'any_name',
        email: 'any_email@mail.com',
        password: 'any_password',
        password_confirmation: 'incorrect_password'
      }
    }
    sut = make_sut.fetch(:sut)
    http_response = sut.handle(http_request)

    expect(http_response[:status_code]).to eq(400)
    expect(http_response[:body]).to eq(InvalidParamError.new(:password_confirmation))
  end

  it 'Should return 400 if an invalid email is provided' do
    http_request = {
      body: {
        name: 'any_name',
        email: 'incorrect_email@mail.com',
        password: 'any_password',
        password_confirmation: 'any_password'
      }
    }
    sut, email_validator_adapter = make_sut.values_at(:sut, :email_validator_adapter)
    allow(email_validator_adapter).to receive(:is_valid?).and_return(false)
    http_response = sut.handle(http_request)

    expect(http_response[:status_code]).to eq(400)
    expect(http_response[:body]).to eq(InvalidParamError.new(:email))
  end
end
