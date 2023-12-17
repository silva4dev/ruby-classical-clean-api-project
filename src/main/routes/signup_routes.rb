# frozen_string_literal: true

require_relative "../../presentation/controllers/signup/signup_controller"
require_relative "../config/middlewares"
require_relative "../adapters/sinatra_route_adapter"

module Main
  module Routes
    class SignupRoutes < Config::Middlewares
      post "/signup" do
        return adapt_route(Presentation::Controllers::Signup::SignupController.new)
          .call(request, response)
          .body
      end
    end
  end
end
