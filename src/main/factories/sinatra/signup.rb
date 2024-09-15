# frozen_string_literal: true

require_relative '../../../validation/email_validator'
require_relative '../../../presentation/controllers/signup/signup_controller'

class SignupFactory
  def self.create
    email_validator_adapter = EmailValidatorAdapter.new
    SignupController.new(email_validator_adapter)
  end
end
