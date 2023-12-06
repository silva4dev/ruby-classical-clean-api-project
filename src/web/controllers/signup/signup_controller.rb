# frozen_string_literal: true

require_relative '../../protocols/controller'

module Web
  module Controllers
    module Signup
      class SignupController
        include Protocols::Controller
        def call(http_request)
          {
            statusCode: 400,
            body: StandardError.new
          }
        end
      end
    end
  end
end
