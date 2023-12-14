# frozen_string_literal: true

require_relative "../../presentation/controllers/signup/signup_controller"
require_relative "../config/middlewares"

module Main
  module Routes
    class SignupRoutes < Config::Middlewares
      post "/signup" do
        return Presentation::Controllers::Signup::SignupController.new.handle(
          request_hash,
          response
        ).to_json
      end
    end
  end
end
