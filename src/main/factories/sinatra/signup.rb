# frozen_string_literal: true

require_relative "../../../utils/email_validator/email_validator_adapter"
require_relative "../../../presentation/controllers/signup/signup_controller"

module Main
  module Factories
    module Sinatra
      class SignupFactory
        def self.create
          email_validator_adapter = Utils::EmailValidator::EmailValidatorAdapter.new
          return Presentation::Controllers::Signup::SignupController.new(email_validator_adapter)
        end
      end
    end
  end
end
