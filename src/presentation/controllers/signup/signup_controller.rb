# frozen_string_literal: true

require_relative "../../protocols/controller"
require_relative "../../helpers/http_helper"
require_relative "../../errors/missing_param_error"
require_relative "../../errors/invalid_param_error"

module Presentation
  module Controllers
    module Signup
      class SignupController
        include Protocols::Controller
        def handle(http_request)
          required_fields = [:name, :email, :password, :password_confirmation]
          required_fields.each do |field|
            if http_request.empty? || http_request[:body][field].to_s.strip == ""
              return Helpers::HttpHelper.bad_request(Errors::MissingParamError.new(field))
            end
          end
          password = http_request[:body][:password]
          password_confirmation = http_request[:body][:password_confirmation]
          if password != password_confirmation
            return Helpers::HttpHelper.bad_request(Errors::InvalidParamError.new(:password_confirmation))
          end
        end
      end
    end
  end
end
