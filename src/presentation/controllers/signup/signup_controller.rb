# frozen_string_literal: true

require_relative '../../protocols/controller'
require_relative '../../helpers/http_helper'
require_relative '../../errors/missing_param_error'
require_relative '../../errors/invalid_param_error'

class SignupController
  def initialize(email_validator)
    @email_validator = email_validator
  end

  def handle(http_request)
    required_fields = %i[name email password password_confirmation]
    required_fields.each do |field|
      if http_request.empty? || http_request[:body][field].to_s.strip == ''
        return HttpHelper.bad_request(MissingParamError.new(field))
      end
    end
    email = http_request[:body][:email]
    password = http_request[:body][:password]
    password_confirmation = http_request[:body][:password_confirmation]
    return HttpHelper.bad_request(InvalidParamError.new(:password_confirmation)) if password != password_confirmation
    return if @email_validator.is_valid?(email)

    HttpHelper.bad_request(InvalidParamError.new(:email))
  end
end
