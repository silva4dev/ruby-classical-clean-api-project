# frozen_string_literal: true

require_relative '../../../validation/email_validator/email_validator_adapter'
require_relative '../../../presentation/controllers/signup/signup_controller'

module Main
  module Factories
    module Sinatra
      class SignupFactory
        def self.create
          email_validator_adapter = Validation::EmailValidator::EmailValidatorAdapter.new
          Presentation::Controllers::Signup::SignupController.new(email_validator_adapter)
        end
      end
    end
  end
end
