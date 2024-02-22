# frozen_string_literal: true

require_relative '../../protocols/controller'
require_relative '../../helpers/http_helper'
require_relative '../../errors/missing_param_error'
require_relative '../../errors/invalid_param_error'

module Presentation
  module Controllers
    module Signup
      class SignupController
        include Protocols::Controller
        attr_reader :email_validator

        def initialize(email_validator)
          @email_validator = email_validator
        end

        def handle(http_request)
          required_fields = %i[name email password password_confirmation]
          required_fields.each do |field|
            if http_request.empty? || http_request[:body][field].to_s.strip == ''
              return Helpers::HttpHelper.bad_request(Errors::MissingParamError.new(field))
            end
          end
          email = http_request[:body][:email]
          password = http_request[:body][:password]
          password_confirmation = http_request[:body][:password_confirmation]
          if password != password_confirmation
            return Helpers::HttpHelper.bad_request(Errors::InvalidParamError.new(:password_confirmation))
          end
          return if @email_validator.is_valid?(email)

          Helpers::HttpHelper.bad_request(Errors::InvalidParamError.new(:email))
        end
      end
    end
  end
end
